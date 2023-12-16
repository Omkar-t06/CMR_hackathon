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
    apiKey: 'AIzaSyDI9RblEJJzxKEnyXhZvxNcmRGcp0UL1k8',
    appId: '1:447172026219:web:19e38805125c7ec6e3f62e',
    messagingSenderId: '447172026219',
    projectId: 'om-hack-hms',
    authDomain: 'om-hack-hms.firebaseapp.com',
    storageBucket: 'om-hack-hms.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBtPT8j10pmBzUueBg0O7ePrl63YKpH-mU',
    appId: '1:447172026219:android:3491778a56082362e3f62e',
    messagingSenderId: '447172026219',
    projectId: 'om-hack-hms',
    storageBucket: 'om-hack-hms.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4l_DATLtKIr_cJc_TGHmb2bntSS5UJgk',
    appId: '1:447172026219:ios:bbacdd24b9ef07b1e3f62e',
    messagingSenderId: '447172026219',
    projectId: 'om-hack-hms',
    storageBucket: 'om-hack-hms.appspot.com',
    iosBundleId: 'com.example.hospitalManageSystem',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD4l_DATLtKIr_cJc_TGHmb2bntSS5UJgk',
    appId: '1:447172026219:ios:46c8ec1c0d011d3ae3f62e',
    messagingSenderId: '447172026219',
    projectId: 'om-hack-hms',
    storageBucket: 'om-hack-hms.appspot.com',
    iosBundleId: 'com.example.hospitalManageSystem.RunnerTests',
  );
}
