import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  
  static login(String username, String password) async {}
   
  static Future<bool> setToken(String token) async {
    // var prefs = Get.find<SharedPreferences>();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('access_token', token);
  }

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token') ?? "";
    return Future.value(token);
  }
   static Future<bool> setRole(String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('role', role);
  }

  static Future<String> getRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String role = prefs.getString('role') ?? "";
    return Future.value(role);
  }

  static removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<String> getmobile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String mobile = prefs.getString('mobile') ?? "";
    return Future.value(mobile);
  }

  static Future<bool> setmobile(String  mobile) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('mobile',  mobile);
  }

  static Future<String> getEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email') ?? "";
    return Future.value(email);
  }

  static Future<bool> setEmail(String  email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('email',  email);
  }

  static Future<String> getUserId() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('userId') ?? "";
    return Future.value(id);
  }

  static Future<bool> setId(String id) async {
 SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('userId', id);
  }
  static Future<bool> getisloggedIn() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
    bool id = prefs.getBool('isLoggedIn')!;
    return Future.value(id);
  }

  static Future<bool> setIsLoggedIn(bool isLoggedIn) async {
 SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool('isLoggedIn', isLoggedIn);
  }

  static removeUniqueName() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
