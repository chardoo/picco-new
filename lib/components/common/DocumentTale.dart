import 'package:docoradi/Models/documents/documentsModel.dart';
import 'package:docoradi/components/common/DocumentDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:docoradi/controller/document_controller.dart';
import 'package:intl/intl.dart';

class DocumentTale extends StatelessWidget {
  // ignore: empty_constructor_bodies
  final DocumentController controller = Get.find<DocumentController>();
  Documents document = Documents(documentURL: "documentURL", firstName: "firstName", objectID: "objectID", companyName: "companyName", isLater: false, isViewed: false, createdTime: "createdTime", mime: "mime");

     // new Documents(documentURL: '', '', '', '', '', false, false, "DateTime(2011, 7, 7)", "");

  @override
  DocumentTale({Key? key, required this.document}) : super(key: key);

  reduceDate(String text) {
    if (text.length > 10) {
      return text.substring(0, 16);
    } else {
      return text;
    }
  }

  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 62,
        width: 343,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ListTile(
          leading: Icon(
            Icons.file_present,
            size: 35,
          ),
          title: Text(
            document.companyName!,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
                fontFamily: 'Open Sans',
                fontSize: 20),
          ),
          subtitle: Text(
            reduceDate(document.createdTime.toString()),
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontFamily: 'Open Sans',
                fontSize: 15),
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () async {
            // controller.openDoc(document.documentURL);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DocumentDetails(document)));
          },
        ));
  }
}
