import 'dart:async';
import 'package:docoradi/API/Auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// import '../contollers/user_controller.dart';
// import '../services/auth/auth_service.dart';
// import "../apis/httpService.dart";
// import '../configuration/constants.dart';
//import '../services/http/constants.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final contactController = TextEditingController();
  var ispasswordHidden = true.obs;
   var isError = false.obs;
  AuthHttpService LoginApi = AuthHttpService();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (value.length < 4) {
      return 'Password too short';
    }
    return null;
  }

  String? contactValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (value.length < 4) {
      return 'Password too short';
    }
    return null;
  }
  String? emailValidator(String? value) {
    final _emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (value.length < 4) {
      return 'Username too short';
    }
    return null;
  }

  Future<dynamic> register() async {
    Map<String, dynamic> loginDetails = {
      "password": passwordController.text,
      "email": emailController.text,
      "mobile": contactController.text

    };
    return await LoginApi.register(loginDetails);

   
  }
}
