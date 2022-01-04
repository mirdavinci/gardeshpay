import 'package:flutter/material.dart';
import 'package:gardeshpay_task/controller/device_registration.dart';
import 'package:gardeshpay_task/controller/user_authentication.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';

import 'email_verification.dart';

class SignUp extends GetView {
  final _form = GlobalKey<FormState>();
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final mailTextController = TextEditingController();
  final userRegController = Get.put(UserRegistrationController());
  final devRegController = Get.put(DeviceRegistrationController());
  static const routeName = '/user_auth';

  SignUp({Key? key}) : super(key: key);

  void _saveForm() {
    _form.currentState!.save();
  }

  Future<void> _submit() async {
    if (!_form.currentState!.validate()) {
      // Invalid!
      return;
    }
    // await userRegController.registerUser(usernameTextController.text,
    //     passwordTextController.text, mailTextController.text);
    await devRegController.registerDevice();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // backgroundColor: Colors.blueGrey.withOpacity(0.8),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Color(0xff3E2B96)),
          backgroundColor: Colors.blueGrey,
          title: const Text(
            'ورود به گردش‌پی',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          //child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: (MediaQuery.of(context).size.height * 0.75),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: usernameTextController,
                      onSaved: (value) {
                        usernameTextController.text = value!;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffA8C0FE))),
                        border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffA8C0FE))),
                        hintText: 'نام کاربری',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordTextController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 5) {
                          return 'پسورد معتبر وارد کنید!';
                        }
                      },
                      onSaved: (value) {
                        passwordTextController.text = value!;
                      },
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffA8C0FE))),
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        hintText: 'رمز عبور',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: mailTextController,
                      onFieldSubmitted: (_) {},
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty || !value.isEmail) {
                          return 'لطفا ایمیل معتبر وارد کنید';
                        }
                      },
                      onSaved: (value) {
                        mailTextController.text = value!;
                      },
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffA8C0FE))),
                        border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffA8C0FE))),
                        hintStyle: const TextStyle(fontSize: 15),
                        hintText: 'example@gmail.com',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 48,
                    width: 343,
                    child: ElevatedButton(
                      child: const Text(
                        'ثبت نام',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      onPressed: () {
                        _saveForm();

                        _submit();
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => const EmailVerification()));
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        //  ),
      ),
    );
  }
}
