import 'dart:async';
import 'package:docoradi/API/Auth/auth.dart';
import 'package:docoradi/Models/Auth/LoginResponse.dart';
import 'package:docoradi/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  var ispasswordHidden = true.obs;
  var isError = false.obs;
  AuthHttpService LoginApi = AuthHttpService();

  AuthService service = AuthService();
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

  String? emailValidator(String? value) {
    //email RegExp
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

  Future<dynamic> login() async {
    Map<String, dynamic> loginDetails = {
      "password": passwordController.text,
      "email": emailController.text,
    };
    var loggedInuser = await LoginApi.login(loginDetails);
    if (loggedInuser.runtimeType == LoginResponseObject) {
      await AuthService.setToken(loggedInuser.token);
      await AuthService.setEmail(loggedInuser.email);
      await AuthService.setRole(loggedInuser.role);
      await AuthService.setmobile(loggedInuser.mobile);
      await AuthService.setIsLoggedIn(true);
      return true;
    } else {

      return false;
    }
  }

  // ignore: non_constant_identifier_names
  Future<bool> createUser() async {
    Map<String, dynamic> loginDetails = {
      "password": passwordController.text,
      "email": emailController.text,
    };
    // var response = await http.adminlogin(loginDetails);
    // await AuthService.setToken(response.token);
    // await AuthService.setId(response.id);
    // await AuthService.setEmail(response.email);
    // await AuthService.setRole(response.role);
    // var userController = Get.put(UserController());
    // userController.authenticated = true;

    return false;
  }
}
