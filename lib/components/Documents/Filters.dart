import 'package:docoradi/controller/document_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:docoradi/controller/login_controller.dart';

class FilterScreen extends StatelessWidget {
  final DocumentController controller = Get.put(DocumentController());

  static const colorizeTextStyle =
      TextStyle(fontSize: 25.0, fontFamily: 'SF', color: Colors.redAccent);
  bool secureTest = true;

  FilterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          leading:  BackButton(
            color: Colors.black,
          
          ),
          elevation: 0,
          centerTitle: true,
          title: Text("Filter",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.normal)),
          backgroundColor: Color.fromARGB(255, 230, 233, 239),
        ),
        backgroundColor: Color.fromARGB(255, 230, 233, 239),
        body: body(context));
  }

  Widget body(context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 230, 233, 239),
            body: ListView(children: [
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Form(key: controller.formKey,
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            Container(
                                height: 45,
                                width: 343,
                                
                                child: TextFormField(
                                  controller: controller.documentController,
                                  decoration: InputDecoration(
                                    focusColor: Colors.white,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    fillColor:
                                        Color.fromARGB(255, 242, 242, 242),
                                    filled: true,
                                    labelText: 'Document Type',
                                    //lable style
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontFamily: "verdana_regular",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                                height: 45,
                                width: 343,
                                child: TextFormField(
                                  controller: controller.companyNameController,
                                  decoration: InputDecoration(
                                    focusColor: Colors.white,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    fillColor:
                                        Color.fromARGB(255, 242, 242, 242),
                                    filled: true,
                                    labelText: 'Company Name',
                                    //lable style
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontFamily: "verdana_regular",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                                height: 45,
                                width: 343,
                                child: TextFormField(
                                  controller: controller.dateController,
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime(2100));
                                    if (pickedDate != null) {}
                                  },
                                  decoration: InputDecoration(
                                    focusColor: Colors.white,

                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    suffixIcon: Icon(Icons.calendar_month),
                                    fillColor:
                                        Color.fromARGB(255, 242, 242, 242),
                                    filled: true,
                                    labelText: 'Select Date',
                                    //lable style
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontFamily: "verdana_regular",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                                height: 45,
                                width: 343,
                                child: TextFormField(
                                  controller: controller.AccountNumbeController,
                                  decoration: InputDecoration(
                                    focusColor: Colors.white,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Color.fromARGB(255, 158, 158, 158),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    fillColor:
                                        Color.fromARGB(255, 242, 242, 242),
                                    filled: true,
                                    labelText: 'Account Number',
                                    //lable style
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontFamily: "verdana_regular",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )),
                            const SizedBox(
                              height: 60,
                            ),
                            SizedBox(
                                width: 343,
                                height: 50,
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Color.fromARGB(255, 18, 19, 19),
                                      backgroundColor:
                                          Color.fromARGB(255, 18, 19, 19),
                                    ),
                                    onPressed: () {
                                      Get.offNamed('/home');
                                    },
                                    child: Text(
                                      "Apply",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ))),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ))
                ],
              ))
            ])));
  }
}
