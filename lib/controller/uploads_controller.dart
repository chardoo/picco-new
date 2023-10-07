import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:docoradi/API/documentTypes/documentsTypes.dart';
import 'package:docoradi/Models/form/formModel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:open_file/open_file.dart';
// import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mime/mime.dart';
// import 'package:file_picker/file_picker.dart';

class UploadController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final documentName = TextEditingController();
  final keyWord = TextEditingController();
  var withDocumentType = false.obs;
  var dropdownvalue =
      Schema(name: "", namespace: '', description: '', fields: []).obs;
  var withOutDocumentType = false.obs;
  List<Schema> documentsTypes = [];
  var formField = [].obs;
  late File _file = null.obs as File;
  var filePath = ''.obs;
  var isDateSelected = false.obs;
  var isClickToSend = false.obs;
  // ignore: prefer_typing_uninitialized_variables
  late var fileName = "filelerr".obs;
  String documentTypeName = '';
  String nameSpace = '';
  late PlatformFile? _platformFile = null.obs as PlatformFile;
  DocumentsTypesHttpService documentHttpService = DocumentsTypesHttpService();

  @override
  onInit() async {
    documentsTypes = await documentHttpService.getDocumentTypes();
    super.onInit();
  }

  String? documenNamevalidator(String? value) {
    if (value == null || value.isEmpty) {
      return '*required ';
    }
    return null;
  }

  void selectFormType(Schema data) async {
    var shema = documentsTypes[documentsTypes.indexOf(data)];
    documentTypeName = shema.name;
    nameSpace = shema.namespace;
    formField.value = shema.fields;
  }

  void selectFile() async {
    final file = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['png', 'jpg', 'jpeg']);
    if (file != null) {
      _file = File(file.files.single.path!);
      fileName.value = file.files.single.name;
      _platformFile = file.files.first;
      filePath.value = _file.path;
    }
    // print("helloe r");
    // print(_file.path);
  }

  Future<dynamic> sendFile(List<Map<String, dynamic>> fileds) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Uint8List fileInByte = await _file.readAsBytes();
    Map<String, dynamic> data = {};

    print("files fileds");
    print(fileds);
    data['account'] = {"id": prefs.getString('email'), "type": "userId"};
    data['properties'] = {
      "type": {"name": documentTypeName, "namespace": nameSpace},
      "fields": fileds
    };
    data['document'] = {
      "mime": lookupMimeType(_file.path),
      "filename": fileName.value,
      "file": base64.encode(fileInByte)
    };

    return await documentHttpService.UploadDocuments(data);
  }

  Future<dynamic> sendFileWithOutType() async {
    List<Map<String, dynamic>> fields;
    fields = [
      {'name': "companyName", 'value': documentName.text.trim().toString()},
      {'name': "keyWord", 'value': keyWord.text.trim().toString()}
    ];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Uint8List fileInByte = await _file.readAsBytes();
    Map<String, dynamic> data = {};

    data['account'] = {"id": prefs.getString('email'), "type": "userId"};
    data['properties'] = {
      "type": {"name": '', "namespace": ''},
      "fields": fields
    };
    data['document'] = {
      "mime": lookupMimeType(_file.path),
      "filename": fileName.value,
      "file": base64.encode(fileInByte)
    };
    return await documentHttpService.UploadDocuments(data);
  }
}
