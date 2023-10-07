import 'dart:convert';

import 'package:docoradi/Models/form/formModel.dart';
import 'package:docoradi/components/form/fields.dart';
import 'package:docoradi/controller/document_controller.dart';
import 'package:docoradi/controller/uploads_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:docoradi/controller/login_controller.dart';

class withDocumentTypeScreen extends StatelessWidget {
  final UploadController controller = Get.put(UploadController());
  final FormFields formFields = FormFields();
  // void getTestSchema() async {
  //   String content = await rootBundle.loadString('assets/testSchema.json');
  //   Map<String, dynamic> jsonMap = json.decode(content);
  //   _jsonSchema.add(Schema.fromJson(jsonMap));
  // }

  withDocumentTypeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          leading: BackButton(
            color: Colors.black,
          ),
          elevation: 0,
          centerTitle: true,
          title: Text("Upload with Document Type",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal)),
          backgroundColor: Color.fromARGB(255, 230, 233, 239),
        ),
        backgroundColor: Color.fromARGB(255, 230, 233, 239),
        body: body(context));
  }

  Widget body(context) {
    controller.dropdownvalue.value = controller.documentsTypes[0];
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 230, 233, 239),
            body: Container(
                margin: EdgeInsets.only(left: 25, right: 20),
                child: Form(
                    key: controller.formKey,
                    child: ListView(children: [
                      Obx(() => Container(
                              child: DropdownButton<Schema>(
                            // Initial Value
                            hint: const Text('select a document type'),
                            value: controller.dropdownvalue.value,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items:
                                controller.documentsTypes.map((Schema items) {
                              return DropdownMenuItem<Schema>(
                                value: items,
                                child: Text(items.name),
                              );
                            }).toList(),

                            onChanged: (Schema? newValue) async {
                              controller.dropdownvalue.value = newValue!;
                              controller.selectFormType(newValue!);
                            },
                          ))),
                      Obx(() => Container(
                            child: controller.formField.value.length == 0
                                ? Column(
                                    children: [],
                                  )
                                : Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Column(
                                          children: controller.formField
                                              .map<Widget>((item) {
                                            return formFields.getWidget(
                                                item as Fields, context);
                                          }).toList(),
                                        ),
                                        GestureDetector(
                                          onTap: controller.selectFile,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 30.0,
                                                  vertical: 5.0),
                                              child: DottedBorder(
                                                borderType: BorderType.RRect,
                                                radius: Radius.circular(10),
                                                dashPattern: [10, 4],
                                                strokeCap: StrokeCap.round,
                                                color: Colors.blue.shade400,
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      color: Colors.blue.shade50
                                                          .withOpacity(.3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.folder_open,
                                                        color: Colors.blue,
                                                        size: 20,
                                                      ),
                                                      Text(
                                                        'Select a File',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors
                                                                .grey.shade400),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                        ),
                                        Obx(() => Container(
                                            child: controller.isClickToSend
                                                            .value ==
                                                        true &&
                                                    controller.filePath.isEmpty
                                                ? Container(
                                                    child: const Text(
                                                      "select a file",
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  )
                                                : Container())),
                                        Obx(() => Container(
                                            child:
                                                controller.filePath.isNotEmpty
                                                    ? Column(
                                                        children: [
                                                          Text(controller
                                                              .filePath.value),
                                                          SizedBox(
                                                            height: 5,
                                                          )
                                                        ],
                                                      )
                                                    : Container())),
                                        SizedBox(
                                            width: 343,
                                            height: 50,
                                            child: TextButton(
                                                style: TextButton.styleFrom(
                                                  // shape: OutlinedBorder(Bordersi),
                                                  primary: Color.fromARGB(
                                                      255, 18, 19, 19),
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 18, 19, 19),
                                                ),
                                                onPressed: () async {
                                                  // print("hello ahoeoroer te");
                                                  controller.isClickToSend
                                                      .value = true;
                                                  if (controller
                                                          .formKey.currentState!
                                                          .validate() &&
                                                      controller.filePath
                                                          .isNotEmpty) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(const SnackBar(
                                                            duration: Duration(
                                                                hours: 1),
                                                            backgroundColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    8,
                                                                    8,
                                                                    8),
                                                            content: Text(
                                                                'Uploading file .....')));
                                                    List<Map<String, dynamic>>
                                                        data = [];

                                                    formFields.data
                                                        .forEach((key, value) {
                                                      data.add({
                                                        "name": key,
                                                        "value": value
                                                      });
                                                    });

                                                    var response =
                                                        await controller
                                                            .sendFile(data);

                                                    if (response == 201) {
                                                      controller
                                                          .filePath.value = '';
                                                      controller.isClickToSend
                                                          .value = false;
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .removeCurrentSnackBar();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(const SnackBar(
                                                              duration: Duration(
                                                                  seconds: 2),
                                                              backgroundColor:
                                                                  Color
                                                                      .fromARGB(
                                                                          255,
                                                                          8,
                                                                          8,
                                                                          8),
                                                              content: Text(
                                                                  'succeffully Upload Swipe downwards in 30secs')));
                                                      Get.offNamed('/home');
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .removeCurrentSnackBar();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(const SnackBar(
                                                              duration: Duration(
                                                                  seconds: 2),
                                                              backgroundColor:
                                                                  Color
                                                                      .fromARGB(
                                                                          255,
                                                                          8,
                                                                          8,
                                                                          8),
                                                              content: Text(
                                                                  'sorry Upload Failed')));
                                                    }
                                                  }
                                                },
                                                child: Text(
                                                  "Upload",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )))
                                      ]),
                          )),
                    ])))));
  }
}
