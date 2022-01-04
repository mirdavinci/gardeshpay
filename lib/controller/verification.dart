import 'package:gardeshpay_task/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class Verification extends GetxController{

  final emailVerifyBox = GetStorage();


  Future<void> verifyEmail(String otpCode) async{
    const url = '$BASE_URL/user/auth/register/email';
    var deviceUuid = emailVerifyBox.read('uuidCode');
    var userMail = emailVerifyBox.read('userMail');

    var response = await http.put(Uri.parse(url), headers: <String,String> {
      'device-id':deviceUuid,
      'Content-Type':'application/x-www-form-urlencoded'
    },
    body: <String, String>{
      'email': userMail,
      'otp_code':otpCode
    });
    print(response.body);
    print(response.statusCode);
  }

}