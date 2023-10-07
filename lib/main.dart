import 'package:docoradi/components/Documents/Filters.dart';
import 'package:docoradi/components/Documents/uploadwithDocumentType.dart';
import 'package:docoradi/components/Documents/uploadwithOutDocumentType.dart';
import 'package:docoradi/controller/login_controller.dart';
import 'package:docoradi/controller/signUp_controller.dart';
import 'package:docoradi/controller/userProfile_controller.dart';
import 'package:docoradi/middleware/authmiddleware.dart';
import 'package:docoradi/screens/Home.dart';
import 'package:docoradi/screens/SignUp.dart';
import 'package:docoradi/screens/login.dart';
import 'package:docoradi/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var prefs = await SharedPreferences.getInstance();
  Get.put(prefs);
  Get.lazyPut(() => UserController());
  Get.lazyPut<LoginController>(() => LoginController());
  Get.put(SignUpController());
  runApp(GetMaterialApp(
     home:  LoginScreen(),
    
    getPages: [
      GetPage(
        name: '/splash',
        page: () => const SplashScreen(),
      ),
      GetPage(
          name: '/home', page: () => HomeScreen(),
           //middlewares: [AuthMiddleWare()]
           ),
      GetPage(
        name: '/signUp',
        page: () => SignUpScreen(),
      ),
      GetPage(name: '/login', page: () => LoginScreen()),
      GetPage(
        name: '/filter',
        page: () => FilterScreen(),
      ),
       GetPage(
        name: '/withType',
        page: () => withDocumentTypeScreen(),
      ),
      GetPage(
        name: '/withOutType',
        page: () => withoutDocumentTypeScreen(),
      ),
    ],
  ));
}
