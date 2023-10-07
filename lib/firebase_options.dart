// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCg1Z8SyRLEHCnDbbNh6pFsaBHacmj_CSI',
    appId: '1:971122412027:web:63acb795d7d9fe1853235e',
    messagingSenderId: '971122412027',
    projectId: 'docxon',
    authDomain: 'docxon.firebaseapp.com',
    storageBucket: 'docxon.appspot.com',
    measurementId: 'G-KBMD4B6JVF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD0lh3BVoU3oRZRKQLoKYcsSLKebnY3GPw',
    appId: '1:971122412027:android:92ff7bea55cc3c1a53235e',
    messagingSenderId: '971122412027',
    projectId: 'docxon',
    storageBucket: 'docxon.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0bMYzUmgWFCBrUOgPrCWVksPyQY0lBvc',
    appId: '1:971122412027:ios:0ba511f975168b0f53235e',
    messagingSenderId: '971122412027',
    projectId: 'docxon',
    storageBucket: 'docxon.appspot.com',
    iosClientId: '971122412027-1i2q4mn0drte3v4eksjoe471h9610m2f.apps.googleusercontent.com',
    iosBundleId: 'com.example.docoradi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB0bMYzUmgWFCBrUOgPrCWVksPyQY0lBvc',
    appId: '1:971122412027:ios:0ba511f975168b0f53235e',
    messagingSenderId: '971122412027',
    projectId: 'docxon',
    storageBucket: 'docxon.appspot.com',
    iosClientId: '971122412027-1i2q4mn0drte3v4eksjoe471h9610m2f.apps.googleusercontent.com',
    iosBundleId: 'com.example.docoradi',
  );
}