import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:docoradi/API/documents/documentsApi.dart';
import 'package:docoradi/Models/documents/documentsModel.dart';
import 'package:docoradi/Models/documents/mime.dart';
import 'package:docoradi/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
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

class UserController extends GetxController {
  AuthService service = AuthService();
  late String email;
  late String Mobile;

  @override
  onInit() async {
    email = await AuthService.getEmail();
    Mobile = await AuthService.getmobile();
    super.onInit();
  }
}
