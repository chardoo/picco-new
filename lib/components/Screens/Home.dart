import 'package:docoradi/components/common/DocumentTale.dart';
import 'package:docoradi/components/dialogs/uploadDialog.dart';
import 'package:docoradi/controller/document_controller.dart';
import 'package:docoradi/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:docoradi/controller/login_controller.dart';

class HomeNavigationScreen extends StatelessWidget {
  UploadDialog uploadDialog = new UploadDialog();
  final DocumentController controller = Get.put(DocumentController());
  final HomeController homecontroller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Home",
          style: TextStyle(
              color: Colors.black, fontSize: 26, fontWeight: FontWeight.w700),
        ),
        backgroundColor: const Color.fromARGB(255, 230, 233, 239),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.onInit();
        },
        child: body(),
      ),
    );
  }

  Widget body() {
    return SafeArea(
        child:Obx(() =>  Scaffold(
            backgroundColor: const Color.fromARGB(255, 230, 233, 239),
            body: controller.loader3.value == true
                ? Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.only(top: 200),
                    child: const CircularProgressIndicator(
                      backgroundColor: Colors.grey,
                      color: Color.fromARGB(255, 27, 16, 29),
                      strokeWidth: 10,
                    ))


                : Column(children: [
                    Container(
                        margin:
                            const EdgeInsets.only(left: 16, right: 16, top: 23),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Form(
                              child: Column(
                                children: [
                                  Container(
                                      height: 40,
                                      
                                      child: TextFormField(
                                        onTap: () {
                                          homecontroller.index.value = 1;
                                        },
                                        decoration: InputDecoration(
                                          focusColor: Colors.white,
                                          prefixIcon: IconButton(
                                              onPressed: () {
                                                // ignore: prefer_const_constructors
                                              },
                                              icon: Icon(Icons.search)),
                                          // suffixIcon: IconButton(
                                          //   icon: const Icon(Icons.filter_alt),
                                          //   color: Colors.grey,
                                          //   onPressed: () {
                                          //     Get.offNamed('/filter');
                                          //   },
                                          // ),

                                          
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          fillColor: const Color.fromARGB(
                                              255, 255, 254, 254),
                                          filled: true,
                                          labelStyle: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontFamily: "verdana_regular",
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        onChanged: (value) {
                                          controller.searchdocuments(value);
                                        },
                                      )),
                                ],
                              ),
                            ))),
                    const SizedBox(
                      height: 29,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 16, right: 16),
                      child: Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              controller.sentDocuments.value.isNotEmpty
                                  ? const Text(
                                      "New Docs",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    )
                                  : const Text(" "),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() => Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 16, right: 16),
                            child: SizedBox(
                              child: controller.sentDocuments.isEmpty
                                  ? Container(
                                      margin: const EdgeInsets.only(
                                          left: 60, right: 40, top: 100),
                                      child: const Text(" ",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 19, 18, 18))),
                                    )
                                  : ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          controller.sentDocuments.length,
                                      itemBuilder:
                                          (BuildContext ctxt, int index) {
                                        return DocumentTale(
                                          document:
                                              controller.sentDocuments[index],
                                        );
                                      },
                                    ),
                            ),
                          ),
                        )),
                    Container(
                      margin: const EdgeInsets.only(left: 16, right: 16),
                      child: Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              controller.myPersonalDocuments.value.isNotEmpty
                                  ? const Text(
                                      "Remind Me",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    )
                                  : const Text(''),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Obx(() => Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 16, right: 16),
                            child: SizedBox(
                              child: controller.myPersonalDocuments.isEmpty
                                  ? Container(
                                      margin: const EdgeInsets.only(
                                          left: 60, right: 40, top: 100),
                                      child: const Text(" ",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 19, 18, 18))),
                                    )
                                  : ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          controller.myPersonalDocuments.length,
                                      itemBuilder:
                                          (BuildContext ctxt, int index) {
                                        return DocumentTale(
                                          document: controller
                                              .myPersonalDocuments[index],
                                        );
                                      },
                                    ),
                            ),
                          ),
                        ))
                  ]))));
  }
}
