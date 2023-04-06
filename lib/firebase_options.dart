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
    apiKey: 'AIzaSyDmoqt3oKWxzuRBcRRbP1Je6a5-CQ67Omg',
    appId: '1:798523920972:web:297adc5ed8e7675238dae9',
    messagingSenderId: '798523920972',
    projectId: 'sawahku-2058d',
    authDomain: 'sawahku-2058d.firebaseapp.com',
    databaseURL: 'https://sawahku-2058d-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'sawahku-2058d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBswe4cE0tZMWseeZkPsYUwG16Vs7DtgSM',
    appId: '1:798523920972:android:59776500c34b0c5a38dae9',
    messagingSenderId: '798523920972',
    projectId: 'sawahku-2058d',
    databaseURL: 'https://sawahku-2058d-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'sawahku-2058d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0QUpH4LPs90jHZIJKLpI-vQKQvYDSEwM',
    appId: '1:798523920972:ios:631b911c7677068138dae9',
    messagingSenderId: '798523920972',
    projectId: 'sawahku-2058d',
    databaseURL: 'https://sawahku-2058d-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'sawahku-2058d.appspot.com',
    iosClientId: '798523920972-f75t7hpotjufmo5oqbmceq8iri20tc58.apps.googleusercontent.com',
    iosBundleId: 'com.example.sawahku',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA0QUpH4LPs90jHZIJKLpI-vQKQvYDSEwM',
    appId: '1:798523920972:ios:631b911c7677068138dae9',
    messagingSenderId: '798523920972',
    projectId: 'sawahku-2058d',
    databaseURL: 'https://sawahku-2058d-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'sawahku-2058d.appspot.com',
    iosClientId: '798523920972-f75t7hpotjufmo5oqbmceq8iri20tc58.apps.googleusercontent.com',
    iosBundleId: 'com.example.sawahku',
  );
}