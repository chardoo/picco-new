import 'package:docoradi/services/GetxAuthService.dart';
import 'package:docoradi/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';

class AuthMiddleWare extends GetMiddleware {
  // final authService = Get.find<GetAuthService>();
  final authService = Get.put(GetAuthService());
  RouteSettings? redirect(String? route) {
    if (!authService.isloggedIn && route != '/login') {
      return const RouteSettings(name: '/login');
    }
  }
}
