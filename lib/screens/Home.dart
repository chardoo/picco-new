import 'package:docoradi/components/Screens/Account.dart';
import 'package:docoradi/components/Screens/DocumentTypes.dart';
import 'package:docoradi/components/Screens/Documents.dart';
import 'package:docoradi/components/Screens/Home.dart';
import 'package:docoradi/controller/document_controller.dart';

import 'package:docoradi/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  // final DocumentController controller1 = Get.put(DocumentController());
  static const colorizeTextStyle =
      TextStyle(fontSize: 25.0, fontFamily: 'SF', color: Colors.redAccent);
  bool secureTest = true;

  HomeScreen({Key? key}) : super(key: key);

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  // ignore: prefer_final_fields
  static List<Widget> _widgetOptions = <Widget>[
    HomeNavigationScreen(),
    DocumentsNavigationScreen(),
    DocumentTypesNavigationScreen(),
    AccountNavigationScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 233, 239),
      body: body(context));
  }

  Widget body(context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 233, 239),
      body: Obx(() => Center(
            child: _widgetOptions.elementAt(controller.index.value),
          )),
      bottomNavigationBar:Obx(() => 
      Container(
        margin: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
        child: 
      BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 230, 233, 239),
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color.fromARGB(255, 156, 155, 155),
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.file_copy,
              color: Color.fromARGB(255, 156, 155, 155),
            ),
            label: 'Documents',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.file_copy,
              color: Color.fromARGB(255, 156, 155, 155),
            ),
            label: 'Types',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Color.fromARGB(255, 156, 155, 155),
            ),
            label: 'Account',
          )
        ],
        currentIndex: controller.index.value,
        selectedItemColor: Colors.black,
        onTap: (value) {
          controller.index.value = value;
        },
      ),
    ))));
  }
}
