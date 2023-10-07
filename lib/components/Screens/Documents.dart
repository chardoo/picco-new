import 'package:docoradi/Models/documents/documentsModel.dart';
import 'package:docoradi/Models/documents/mime.dart';
import 'package:docoradi/components/common/DocumentTale.dart';
import 'package:docoradi/components/dialogs/uploadDialog.dart';
import 'package:docoradi/controller/document_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:docoradi/controller/login_controller.dart';
import 'package:find_dropdown/find_dropdown.dart';

class DocumentsNavigationScreen extends StatelessWidget {
  UploadDialog uploadDialog = new UploadDialog();
  final DocumentController controller = Get.put(DocumentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Documents",
            style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.normal),
          ),
          backgroundColor: const Color.fromARGB(255, 230, 233, 239),
        ),
        floatingActionButton: new FloatingActionButton(
          backgroundColor: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.upload_file,
                color: Color.fromARGB(255, 245, 243, 243),
              )
            ],
          ),
          onPressed: () {
            uploadDialog.showcontent(context);
          },
        ),
        body: RefreshIndicator(
            onRefresh: () async {
              controller.onInit();
            },
            child: body()));
  }

  Widget body() {
    
    return 
    
    
    SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 230, 233, 239),
            body: Column(children: [
              Container(
                  margin: const EdgeInsets.only(left: 16, right: 16, top: 23),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Form(
                        child: Column(
                          children: [
                            Container(
                                height: 40,
                                // width: 343,
                                child: TextFormField(
                                  // onTap: () => ,

                                  decoration: InputDecoration(
                                  
                                    focusColor: Colors.white,
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.filter_alt),
                                      color: Colors.grey,
                                      onPressed: () {
                                        Get.offNamed('/filter');
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    fillColor:
                                        const Color.fromARGB(255, 255, 254, 254),
                                    filled: true,
                                    // labelText: 'Search',
                                    //lable style
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "My Documents",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Obx(
                      () => Container(
                          height: 32,
                          width: 79,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton<dynamic>(
                            value: controller.firstValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: controller.mimeTypes.map((dynamic items) {
                              var splitted = items.name.toString().split("/");
                              return DropdownMenuItem(
                                value: items,
                                child: Text(splitted[splitted.length - 1]
                                    .capitalizeFirst!),
                              );
                            }).toList(),
                            onChanged: (dynamic value) async {
                              controller.changeSelected.value = controller.changeSelected.value + 1;

                              controller.firstValue = '';

                              controller.firstValue = value;

                              await controller.searchWithMime(value.name);
                            },
                          ))),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              Obx(() => 
              
              Expanded(
                    child: 

        //            StreamBuilder(
        // stream: controller.documentsController.stream,
        // builder: (BuildContext context, AsyncSnapshot<List<DocumentResponse>> snapshot) {
        //   if (snapshot.hasData) {
        //     var data = snapshot.requireData;
        //     if (snapshot.requireData.isEmpty) {
        //       return const Center(child: Text("No document"));
        //     }

        //     return ListView.builder(
        //         itemCount: snapshot.data!.length,
        //         padding: const EdgeInsets.only(top: 10, bottom: 10),
        //         itemBuilder: (context, index) {
        //           DocumentResponse resp = data[index];
                  
        //           return DocumentTale(document:resp.document ,);
        //         },
        //       );
            
        //   }

        //   return const Center(child: CircularProgressIndicator());
        // }),
                    
                    Container(
                      margin: const EdgeInsets.only(left: 16, right: 16),
                      child: SizedBox(
                        child: controller.loader.value == true
                            ? Container(
                                alignment: Alignment.topCenter,
                                margin: const EdgeInsets.only(top: 20),
                                child: const CircularProgressIndicator(
                                  backgroundColor: Colors.grey,
                                  color: Color.fromARGB(255, 27, 16, 29),
                                  strokeWidth: 10,
                                ))
                            : controller.documents.isEmpty
                                ? Container(
                                    margin: const EdgeInsets.only(
                                        left: 60, right: 40, top: 100),
                                    child: const Text("Sorry no ducoment found!  ",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 19, 18, 18))),
                                  )
                                : ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: controller.documents.length,
                                    itemBuilder:
                                        (BuildContext ctxt, int index) {
                                      return DocumentTale(
                                        document: controller.documents[index],
                                      );
                                    },
                                  ),
                      ),
                    ),
                  ))
            ])));
  }
}
