import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gardeshpay_task/view/user_authentication.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const BASE_URL = 'https://cook-mook.com/api/v1';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  await GetStorage.init('MyStorage');
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignUp());
  }
}
