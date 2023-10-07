import 'dart:async';

import 'package:docoradi/controller/login_controller.dart';
import 'package:docoradi/controller/userProfile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  final loginController = Get.find<LoginController>();
  final userController = Get.find<UserController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.black
        ),
        child: const Center(
            child: Text(
              'Docoradi',
              style: TextStyle(color: Colors.red, fontSize: 45),
            )
        ),
      ),
    );
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () async{
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  void navigateUser() async{
      Get.offNamed('/home');
  }
}