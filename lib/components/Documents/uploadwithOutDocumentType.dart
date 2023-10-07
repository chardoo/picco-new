import 'package:docoradi/controller/document_controller.dart';
import 'package:docoradi/controller/uploads_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:docoradi/controller/login_controller.dart';

class withoutDocumentTypeScreen extends StatelessWidget {
  final DocumentController controller = Get.put(DocumentController());
  final UploadController uploadController = Get.put(UploadController());
  static const colorizeTextStyle =
      TextStyle(fontSize: 25.0, fontFamily: 'SF', color: Colors.redAccent);
  bool secureTest = true;

  withoutDocumentTypeScreen({Key? key}) : super(key: key);
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
          title: Text("Upload a Document",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
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
                  Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Column(
                              children: [
                                SizedBox(height: 30,),
                                Container(
                                    height: 65,
                                    width: 343,
                                    child: TextFormField(
                                      controller: uploadController.documentName,
                                      validator: (value) => uploadController
                                          .documenNamevalidator(value),
                                      decoration: InputDecoration(
                                         helperText: '',
                                        focusColor: Colors.white,
                                        prefixIcon: Icon(
                                          Icons.book,
                                          color: Colors.grey,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        fillColor:
                                            Color.fromARGB(255, 242, 242, 242),
                                        filled: true,
                                        labelText: 'Document name',
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
                                    height: 65,
                                    width: 343,
                                    child: TextFormField(
                                      controller: uploadController.keyWord,
                                      validator: (value) => uploadController
                                          .documenNamevalidator(value),
                                      decoration: InputDecoration(
                                         helperText: '',
                                        focusColor: Colors.white,
                                        prefixIcon: Icon(
                                          Icons.note,
                                          color: Colors.grey,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        fillColor:
                                            Color.fromARGB(255, 242, 242, 242),
                                        filled: true,
                                        labelText: 'Key word to remember',
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
                                GestureDetector(
                                  onTap: uploadController.selectFile,
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30.0, vertical: 5.0),
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
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                                    color:
                                                        Colors.grey.shade400),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                                Obx(() => Container(
                                            child: uploadController.isClickToSend
                                                            .value ==
                                                        true &&
                                                    uploadController.filePath.isEmpty
                                                ? Container(
                                                    child: const Text(
                                                      "select a file",
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  )
                                                : Container())),
                                Obx(() => Container(
                                    child: uploadController.filePath.isNotEmpty
                                        ? Column(
                                            children: [
                                              Text(uploadController
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
                                          primary:
                                              Color.fromARGB(255, 18, 19, 19),
                                          backgroundColor:
                                              Color.fromARGB(255, 18, 19, 19),
                                        ),
                                        onPressed: () async {
                                       uploadController.isClickToSend
                                                      .value = true;
                                          if (controller.formKey.currentState!
                                              .validate() &&
                                                      uploadController.filePath
                                                          .isNotEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    duration:
                                                        Duration(hours: 1),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 8, 8, 8),
                                                    content: Text(
                                                        'Uploading file .....')));

                                            var response =
                                                await uploadController
                                                    .sendFileWithOutType();

                                            if (response == 201) {
                                              uploadController.isClickToSend
                                                          .value = false;
                                              uploadController.filePath.value =
                                                  '';
                                              uploadController.keyWord.clear();
                                              uploadController.documentName
                                                  .clear();
                                              ScaffoldMessenger.of(context)
                                                  .removeCurrentSnackBar();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      duration:
                                                          Duration(seconds: 2),
                                                      backgroundColor:
                                                          Color.fromARGB(
                                                              255, 8, 8, 8),
                                                      content: Text(
                                                          'succeffully Upload Swipe downwards in 30secs')));
                                              Get.offNamed('/home');
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .removeCurrentSnackBar();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      duration:
                                                          Duration(seconds: 2),
                                                      backgroundColor:
                                                          Color.fromARGB(
                                                              255, 8, 8, 8),
                                                      content: Text(
                                                          'sorry Upload Failed')));
                                            }
                                          }
                                        },
                                        child: Text(
                                          "Upload",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        )))
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
