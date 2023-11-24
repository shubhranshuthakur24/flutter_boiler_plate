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
    apiKey: 'AIzaSyBeKjBbO6i5dD_6SwBKFLFlK5XRvSsedFo',
    appId: '1:1057337332423:web:331ddd0a42628550fce4e2',
    messagingSenderId: '1057337332423',
    projectId: 'chat-app-ab6ee',
    authDomain: 'chat-app-ab6ee.firebaseapp.com',
    storageBucket: 'chat-app-ab6ee.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBc-mTX0WPA-of48ad39UlFHclPIHbn4WE',
    appId: '1:1057337332423:android:4b2a678e640999abfce4e2',
    messagingSenderId: '1057337332423',
    projectId: 'chat-app-ab6ee',
    storageBucket: 'chat-app-ab6ee.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAAq9iQAkdHDwUO0Gu_7Z6Jh5jNM-Rx7qw',
    appId: '1:1057337332423:ios:153f886d99b04bb3fce4e2',
    messagingSenderId: '1057337332423',
    projectId: 'chat-app-ab6ee',
    storageBucket: 'chat-app-ab6ee.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );
}
