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
    apiKey: 'AIzaSyDaWJlILK_XeJh1hI7Gt0Fo_BvwzNLjjcI',
    appId: '1:116738887653:web:72e8cbd05d31098c29690c',
    messagingSenderId: '116738887653',
    projectId: 'eduhub-mobile-3c9b6',
    authDomain: 'eduhub-mobile-3c9b6.firebaseapp.com',
    storageBucket: 'eduhub-mobile-3c9b6.appspot.com',
    measurementId: 'G-H03RZEN05K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDInQwlHU68Sz6KWLmI-qHVXjvCxQzR1-E',
    appId: '1:116738887653:android:3ab6f381bbb2e82d29690c',
    messagingSenderId: '116738887653',
    projectId: 'eduhub-mobile-3c9b6',
    storageBucket: 'eduhub-mobile-3c9b6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYW_JcjIGx1e7qyfCE8V-s9nUzGFxmKQk',
    appId: '1:116738887653:ios:5834a7c2026bb74a29690c',
    messagingSenderId: '116738887653',
    projectId: 'eduhub-mobile-3c9b6',
    storageBucket: 'eduhub-mobile-3c9b6.appspot.com',
    iosBundleId: 'com.example.eduhubMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCYW_JcjIGx1e7qyfCE8V-s9nUzGFxmKQk',
    appId: '1:116738887653:ios:2acddac3a75cdcdc29690c',
    messagingSenderId: '116738887653',
    projectId: 'eduhub-mobile-3c9b6',
    storageBucket: 'eduhub-mobile-3c9b6.appspot.com',
    iosBundleId: 'com.example.eduhubMobile.RunnerTests',
  );
}