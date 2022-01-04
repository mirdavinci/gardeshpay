import 'package:gardeshpay_task/view/email_verification.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../main.dart';

class UserRegistrationController extends GetxController {

  final box = GetStorage();

  Future<void> registerUser(
      String username, String password, String email) async {
    const url = '$BASE_URL/user/auth/register/email';
    var deviceUuid = box.read('uuidCode');
    try {
      var response = await http.post(Uri.parse(url), headers: <String, String>{
        'device-id': deviceUuid.toString(),
        'Content-Type': 'application/x-www-form-urlencoded'
      }, body: <String, String>{
        'username': username,
        'email': email,
        'password': password
      });
      box.write('userMail', email);
      // if (response.statusCode == 200) {
      //   Get.to(const EmailVerification());
      // }
      print(response.statusCode);
      print(deviceUuid);
    } catch (err) {
      rethrow;
    }
  }
}
