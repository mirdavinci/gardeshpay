import 'package:flutter/material.dart';
import 'package:gardeshpay_task/controller/device_registration.dart';
import 'package:gardeshpay_task/view/user_authentication.dart';
import 'package:get/get.dart';

class DeviceRegistration extends GetView {
  DeviceRegistration({Key? key}) : super(key: key);

  final DeviceRegistrationController verifyEmailController =
      Get.put(DeviceRegistrationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeviceRegistrationController>(builder: (authController) {
      return Scaffold(
        backgroundColor: const Color(0xffF6F8F7),
        body: Center(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.pinkAccent)),
            onPressed: () {
              authController.registerDevice();
            },
            child: const Text('Press'),
          ),
        ),
      );
    });
  }
}
