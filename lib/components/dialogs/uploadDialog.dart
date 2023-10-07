import 'package:docoradi/components/Documents/uploadwithDocumentType.dart';
import 'package:docoradi/components/Documents/uploadwithOutDocumentType.dart';
import 'package:docoradi/controller/uploads_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class UploadDialog {
  UploadController uploadController = Get.put(UploadController());
  void showcontent(context) {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Upload Document'),
              IconButton(
                icon: Icon(Icons.close_outlined),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Row(
                  children: <Widget>[
                    Obx(() => Checkbox(
                          value: uploadController.withDocumentType.value,
                          onChanged: (bool? newValue) {
                            uploadController.withDocumentType.value =
                                !uploadController.withDocumentType.value;
                            uploadController.withOutDocumentType.value =
                                !uploadController.withDocumentType.value;
                          },
                        )),
                    Expanded(child: Text("with a document type")),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Obx(() => Checkbox(
                          value: uploadController.withOutDocumentType.value,
                          onChanged: (bool? newValue) {
                            uploadController.withOutDocumentType.value =
                                !uploadController.withOutDocumentType.value;
                            uploadController.withDocumentType.value =
                                !uploadController.withOutDocumentType.value;
                          },
                        )),
                    Expanded(child: Text("withOut a document type")),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            SizedBox(
                width: 343,
                height: 50,
                child: TextButton(
                    style: TextButton.styleFrom(
                      // shape: OutlinedBorder(Bordersi),
                      primary: Color.fromARGB(255, 18, 19, 19),
                      backgroundColor: Color.fromARGB(255, 18, 19, 19),
                    ),
                    onPressed: () async {
                      if (uploadController.withDocumentType.value == true) {
                        print('hrhe');
                                   Get.offNamed('/withType');
                      } else {
                        print('hrhe rjerejre');
                                Get.offNamed('/withOutType');
                      }
                    },
                    child: Text(
                      "Done",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ))),
          ],
        );
      },
    );
  }
}
