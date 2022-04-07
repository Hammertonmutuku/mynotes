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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAQPdKW9QMNZ_F4eXq5yIXktqqzP3rb_BU',
    appId: '1:916671151479:web:155828ebe6a45e6dacf572',
    messagingSenderId: '916671151479',
    projectId: 'mynotes254',
    authDomain: 'mynotes254.firebaseapp.com',
    storageBucket: 'mynotes254.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAtLRTgh2JQF-YvIwDbg-NPqYhasJ9MKl4',
    appId: '1:916671151479:android:03ab9e32cea64ab4acf572',
    messagingSenderId: '916671151479',
    projectId: 'mynotes254',
    storageBucket: 'mynotes254.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAm47aHno2d9LMOBWyWA-qzr44rviVJrsU',
    appId: '1:916671151479:ios:1eebb99e837dc7c4acf572',
    messagingSenderId: '916671151479',
    projectId: 'mynotes254',
    storageBucket: 'mynotes254.appspot.com',
    iosClientId: '916671151479-53bf9pu64l996fbgs8370684tp13s1th.apps.googleusercontent.com',
    iosBundleId: 'com.example.mynotes',
  );
}