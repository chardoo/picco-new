import 'dart:io';

import 'package:docoradi/Models/documents/documentsModel.dart';
import 'package:docoradi/Models/documents/mime.dart';
import 'package:docoradi/Models/form/formModel.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:docoradi/Models/Auth/LoginResponse.dart';

class DocumentsTypesHttpService {
  static const BASE_URL = "https://docoradi-app-phrl5joxbq-uc.a.run.app";
  static const getDocumentTypesUrl =
      // ignore: prefer_interpolation_to_compose_strings
      BASE_URL + '/service/documentsTypes/getdocumentsTypes';

  static const UploadsUrl =
      // ignore: prefer_interpolation_to_compose_strings
      BASE_URL + '/service/documentsTypes/uploadDocument';
  var localOptions2 = BaseOptions(
    baseUrl: 'https://docoradi-app-phrl5joxbq-uc.a.run.app',
    connectTimeout: 60 * 1000, // 60 seconds
    receiveTimeout: 60 * 1000,
    headers: {
      HttpHeaders.acceptHeader: "accept: application/json",
    }, // 60 seconds
  );

  Future<List<Schema>> getDocumentTypes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final res = await get(
      Uri.parse(getDocumentTypesUrl),
    );
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Schema> documentsTypes = body
          .map(
            (dynamic item) => Schema.fromMap(item),
          )
          .toList();

      return documentsTypes;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<dynamic> UploadDocuments(resquestData) async {
    Dio dio2 = Dio(localOptions2);
    print("request data");
    print(resquestData);
    final res = await post(Uri.parse(UploadsUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(resquestData));
    print(res.body);
    return res.statusCode;
  }
}
