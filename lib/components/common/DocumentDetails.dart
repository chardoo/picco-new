import 'package:docoradi/controller/document_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'package:gcloud/storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:googleapis/people/v1.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';
import '../../Models/documents/documentsModel.dart';
import 'dart:convert';
import 'package:http/http.dart';
import "package:http/http.dart" as http;
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';

import 'package:thumbnailer/thumbnailer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DocumentDetails extends StatefulWidget {
  final Documents doc;

  DocumentDetails(this.doc);
  @override
  _DocumentUtil createState() => _DocumentUtil();
}

class _DocumentUtil extends State<DocumentDetails> {
  dynamic image = Uint8List(0);
  final DocumentController controller = Get.put(DocumentController());
  get dir => null;

  get fileName => null;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 233, 239),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        leading: const BackButton(
          color: Colors.black, // <-- SEE HERE
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(widget.doc.companyName,
            style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.normal)),
        backgroundColor: Color.fromARGB(255, 230, 233, 239),
      ),
      body:Container(
        color: Color.fromARGB(255, 230, 233, 239),
        child: 
      
       Column(
        
        children: [
          // Container(
          //   color: Colors.white,
          //   child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          //     Text("data"),
          //     Text("data"),
          //     Text("data"),
          //   ]),
          // ),
          GestureDetector(
            onTap: () async {
              await controller.openDocuments(widget.doc.documentURL);
            },
            child: Container(
              color: Colors.white,
              height: 621,
             
              child: Thumbnail(
                dataResolver: () =>
                    controller.thumnailsOpening(widget.doc.documentURL),
                mimeType: widget.doc.mime,
                dataSize: 102345,
                widgetSize: 500,
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              margin: EdgeInsets.only(left: 50, right: 50, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                          fixedSize: const Size(60, 60)),
                      child: const Icon(
                        Icons.inbox,
                        color: Colors.black,
                      )),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                          fixedSize: const Size(60, 60)),
                      child: const Icon(
                        Icons.download,
                        color: Colors.black,
                      )),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                          fixedSize: const Size(60, 60)),
                      child: const Icon(
                        Icons.share,
                        color: Colors.black,
                      ))
                ],
              ))
        ],
      ),
     ) );
  }

  
}
