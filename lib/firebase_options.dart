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
    apiKey: 'AIzaSyCfSVLiB3G7J3d9VLFv_aePmwvCxwIMdHM',
    appId: '1:675941777823:web:dbe90e3d9565766c1d3daa',
    messagingSenderId: '675941777823',
    projectId: 'chat-app-7e1e0',
    authDomain: 'chat-app-7e1e0.firebaseapp.com',
    storageBucket: 'chat-app-7e1e0.appspot.com',
    measurementId: 'G-2C9KFJQKXD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTfnqtLQIP6X8h7WdzMFkeFX3laG9Tix8',
    appId: '1:675941777823:android:ecf1ba8dd435cc401d3daa',
    messagingSenderId: '675941777823',
    projectId: 'chat-app-7e1e0',
    storageBucket: 'chat-app-7e1e0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAWx025l49Mj1JnWpk3R94OrtlKLuRJYrk',
    appId: '1:675941777823:ios:19b8011f4550b3e71d3daa',
    messagingSenderId: '675941777823',
    projectId: 'chat-app-7e1e0',
    storageBucket: 'chat-app-7e1e0.appspot.com',
    iosClientId: '675941777823-4fvn88lgpkclgr0d3eg2rlst6cofcnjp.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}
