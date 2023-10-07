import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:docoradi/API/documents/documentsApi.dart';
import 'package:docoradi/Models/documents/documentsModel.dart';
import 'package:docoradi/Models/documents/mime.dart';
import 'package:docoradi/controller/firestore_apis.dart';
import 'package:docoradi/utils/credentials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:open_file/open_file.dart';
// import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

// import 'package:file_picker/file_picker.dart';
import 'package:gcloud/storage.dart';
import 'package:googleapis/people/v1.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final documentController = TextEditingController();
  final companyNameController = TextEditingController();
  final dateController = TextEditingController();
  final AccountNumbeController = TextEditingController();
  DocumentsHttpService documentHttpService = DocumentsHttpService();
  RxList documents = [].obs;
  RxList myPersonalDocuments = [].obs;
  RxList sentDocuments = [].obs;
  RxList mimeTypes = [].obs;
  var loader = false.obs;
  var loader2 = false.obs;
  var loader3 = false.obs;
  dynamic firstValue = null.obs;
  var changeSelected = 1.obs;
  late StreamController<List<DocumentResponse>> documentsController;
    final FireStoreApis _apis = FireStoreApis();
  @override
  onInit() async {
    initialDocuments();
    //documents.clear();
    

     loader3.value = true;
      sentDocuments.value = await documentHttpService.sentDocuments();
    //   loader3.value = false;
   
    // loader2.value = true;
    myPersonalDocuments.value = await documentHttpService.personalUploadsDocuments();
    loader3.value = false;
    loader.value = true;
    List<Documents> data = await documentHttpService.getDocuments();
    loader.value = false;
    documents.value = data;
    List<MimeTypeModel> mimeTypesdata = await documentHttpService.getMime();
    mimeTypes.value = mimeTypesdata;
    mimeTypes.sort((a, b) => a.name.compareTo(b.name));
    firstValue = mimeTypes[0];
    

    super.onInit();
  }
  void initialDocuments() async {
  
    Stream<List<DocumentResponse>>  initialDoument = await _apis.getInitalDdouments();
    initialDoument.listen((response) {
      print("dkkdfkfdkfkfdkf");
      print(response);
      documentsController.sink.add(response);
      // if (response.isNotEmpty) _initializeName(response.first.message.name);
    });
  }

  void initialPersonal() async {
  
    var initialDoument = await _apis.getInitalDdouments();
    initialDoument.listen((response) {
      documentsController.sink.add(response);
      // if (response.isNotEmpty) _initializeName(response.first.message.name);
    });
  }


  Future<void> searchWithMime(dynamic mimeType) async {
    loader.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (mimeType == 'all') {
      onInit();
    } else {
      var payload = {"userId": prefs.getString('email'), "mimeType": mimeType};
      List<Documents> data =
          await documentHttpService.getDocumentsByMimeTypes(payload);
      documents.clear();
      documents.value = data;
      loader.value = false;
    }
  }

  Future<List<Documents>> searchdocuments(String searchKey) async {
    loader.value = true;
    List<Documents> searchedDocuments =
        await documentHttpService.searchDocuments(searchKey);
    documents.value = searchedDocuments;
    loader.value = false;
    return searchedDocuments;
  }

  Future<Uint8List> thumnailsOpening(link) async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    var credentials = auth.ServiceAccountCredentials.fromJson(Credentials.GoogleCredential);
    var client =
        await auth.clientViaServiceAccount(credentials, Storage.SCOPES);
    var httpsUri = Uri.parse(link);
    var me = await client.get(httpsUri);
    return me.bodyBytes;
  }

  Future<void> openDocuments(String link) async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    var credentials = auth.ServiceAccountCredentials.fromJson(Credentials.GoogleCredential);
    var client =
        await auth.clientViaServiceAccount(credentials, Storage.SCOPES);

    var httpsUri = Uri.parse(link);
    var me = await client.get(httpsUri);
    String contentType = me.headers['content-type'] as String;
    final splitted = contentType.split('/');
    final exten = splitted[splitted.length - 1];
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    File filee = File(path.join(documentDirectory.path, '$fileName.$exten'));
    filee.writeAsBytes(me.bodyBytes);
    await OpenFile.open(filee.path);
  }

  Future<bool> filterDocuments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> filterDetails = {
      "documentType": documentController.text,
      "date": dateController.text,
      "accountNumber": AccountNumbeController.text,
      "companyName": companyNameController.text,
      "userId": prefs.getString('email')
    };
    return true;
  }
}
