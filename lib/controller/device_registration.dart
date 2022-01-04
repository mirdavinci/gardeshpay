import 'dart:io';

import 'package:gardeshpay_task/controller/user_authentication.dart';
import 'package:gardeshpay_task/main.dart';
import 'package:gardeshpay_task/view/email_verification.dart';
import 'package:gardeshpay_task/view/user_authentication.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class DeviceRegistrationController extends GetxController {
  final userRegController = Get.put(UserRegistrationController());
  var username = ''.obs;
  var password = ''.obs;
  var email = ''.obs;

  String generateUuid() {
    var uuid = const Uuid();

    return uuid.v4();
  }

  Future<void> registerDevice() async {
    final box = GetStorage();
    HttpOverrides.global = MyHttpOverrides();

    var uuid = generateUuid();
    const url = '$BASE_URL/device/register';

    try {
      var response = await http.put(Uri.parse(url), headers: <String, String>{
        'device-id': uuid,
        'Content-Type': 'application/x-www-form-urlencoded'
      }, body: <String, String>{
        'platform_type': 'Android',
        'app_store_type': 'google_play',
        'app_version': '0.0.2',
        'os_version': '11.0.0',
        'fcm_token': 'FCM_TOKEN',
        'apns_token': 'APNS_TOKEN',
        'device_model': 'xiaomi_redmi_note9_pro',
        'device_manufacture': 'Xiaomi'
      });

      print(response.body);
      box.write('uuidCode', uuid);
      // if ((response.body["status"]["is_success"] as bool) == 'true') {
      if (response.statusCode == 200) {
        await userRegController.registerUser(
            username.value, password.value, email.value);
        Get.to( () => const EmailVerification());
      }

      // }
      print(box.read('uuidCode'));
    } catch (err) {
      rethrow;
    }
  }
}
