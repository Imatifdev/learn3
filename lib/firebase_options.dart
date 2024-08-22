// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBJaXwJbv2m4b5EzWNCiXMYTxOdi2OubKs',
    appId: '1:516649967648:web:c3728d937128d5ccc3dc45',
    messagingSenderId: '516649967648',
    projectId: 'learn3-eeda2',
    authDomain: 'learn3-eeda2.firebaseapp.com',
    storageBucket: 'learn3-eeda2.appspot.com',
    measurementId: 'G-BSQKS4V7ND',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3ypa77wVQAyDDYYx5kvWHzHTByV0FH4g',
    appId: '1:516649967648:android:98aa929abdbb83e9c3dc45',
    messagingSenderId: '516649967648',
    projectId: 'learn3-eeda2',
    storageBucket: 'learn3-eeda2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2VZJ_T-Z8laE5kH2jZ_inv2wnMB_-mNM',
    appId: '1:516649967648:ios:310916b58e4a7865c3dc45',
    messagingSenderId: '516649967648',
    projectId: 'learn3-eeda2',
    storageBucket: 'learn3-eeda2.appspot.com',
    iosBundleId: 'com.example.learn3',
  );
}