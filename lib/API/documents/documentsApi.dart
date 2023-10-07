import 'package:docoradi/Models/documents/documentsModel.dart';
import 'package:docoradi/Models/documents/mime.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:docoradi/Models/Auth/LoginResponse.dart';

class DocumentsHttpService {
  static const BASE_URL = "https://docoradi-app-phrl5joxbq-uc.a.run.app";
  //static const BASE_URL = "http://localhost:8080/";
  static const documentURL = '$BASE_URL/service/documents/initialDocuments';
  static const mimeUrl = '$BASE_URL/service/documents/getDocumentTypes';
  static const mimeFiles = '$BASE_URL/service/documents/getFilesByMimeTypes';
  static const searchURL = '$BASE_URL/service/documents/search';
  static const personalDocuments =
      '$BASE_URL/service/documents/personalUploads';
  static const sentDocumentUrl = BASE_URL + '/service/documents/sent';

  Future<List<Documents>> getDocuments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final res = await post(Uri.parse(documentURL),
        body: {'userId': prefs.getString('email')});
    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);
      List<dynamic> body = data['sent'];
      List<Documents> documents = body
          .map(
            (dynamic item) => Documents.fromMap(item),
          )
          .toList();
      return documents;
    } else {
      // return res;
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<Documents>> personalUploadsDocuments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final res = await post(Uri.parse(personalDocuments),
        body: {'userId': prefs.getString('email')});

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Documents> documents = body
          .map(
            (dynamic item) => Documents.fromMap(item),
          )
          .toList();
           print("hello tjeejrj");
      print(documents);
      return documents;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<Documents>> sentDocuments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final res = await post(Uri.parse(sentDocumentUrl),
        body: {'userId': prefs.getString('email')});

    if (res.statusCode == 200) {

      List<dynamic> body = jsonDecode(res.body);

      List<Documents> documents = body
          .map(
            (dynamic item) => Documents.fromMap(item),
          )
          .toList();
      
       print("hello tjeejrj");
      print(documents);
      return documents;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<MimeTypeModel>> getMime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final res = await post(Uri.parse(mimeUrl),
        body: {'userId': prefs.getString('email')});
    if (res.statusCode == 200) {
      dynamic data = jsonDecode(res.body);
      List<dynamic> body = data["mimes"];
      List<MimeTypeModel> mimeTypes = body
          .map(
            (dynamic item) => MimeTypeModel.fromMap(item),
          )
          .toList();
      return mimeTypes;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<Documents>> getDocumentsByMimeTypes(resquestData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final res = await post(Uri.parse(mimeFiles),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(resquestData));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Documents> documents = body
          .map(
            (dynamic item) => Documents.fromMap(item),
          )
          .toList();
      return documents;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<Documents>> searchDocuments(String searchIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final searchresults = await post(Uri.parse(searchURL),
        body: {'userId': prefs.getString('email'), 'searchIndex': searchIndex});
    if (searchresults.statusCode == 200) {
      List<dynamic> body = jsonDecode(searchresults.body);
      List<Documents> documents = body
          .map(
            (dynamic item) => Documents.fromMap(item),
          )
          .toList();
      return documents;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
