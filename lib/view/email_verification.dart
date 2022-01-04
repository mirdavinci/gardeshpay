import 'package:flutter/material.dart';
import 'package:gardeshpay_task/controller/verification.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    final emailVerifyController = TextEditingController();
    final Verification verifyController = Get.put(Verification());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
         appBar: AppBar(
          shadowColor: Colors.black,
          backgroundColor: Colors.blueAccent.withOpacity(0.5),
          // title:Image.asset('assets/gardeshpay.jpg', scale: 20,) ,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SizedBox(
          height: deviceHeight,
          child: Center(
            child: Column(
              children: [
                Container(
                  width: deviceWidth * 0.7,
                  margin: const EdgeInsets.only(left: 75, top: 40),
                     child: TextFormField(
                      controller: emailVerifyController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffA8C0FE))),
                        border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffA8C0FE))),
                        hintText: 'کد ارسال شده به ایمیل را وارد کنید',
                         prefixIcon: Icon(
                          Icons.code,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                 ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      verifyController.verifyEmail(emailVerifyController.text);
                    },
                    child: const Text('ثبت کد'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
