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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBEpqYW395WtxcnVfolt1Br3E29qdSPX7M',
    appId: '1:966942504507:web:42f81d5f6b561b8ddc0e1e',
    messagingSenderId: '966942504507',
    projectId: 'clot-app-40847',
    authDomain: 'clot-app-40847.firebaseapp.com',
    storageBucket: 'clot-app-40847.firebasestorage.app',
    measurementId: 'G-452E4657FN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCcvu0wMB1qMum7yqbe2uDzzLE2kifMkY',
    appId: '1:966942504507:android:e28250734cd0ba9adc0e1e',
    messagingSenderId: '966942504507',
    projectId: 'clot-app-40847',
    storageBucket: 'clot-app-40847.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3mtO1WyaOtYxMTs-dB_Gi3PiCG8zWDII',
    appId: '1:966942504507:ios:3da9663604c0b498dc0e1e',
    messagingSenderId: '966942504507',
    projectId: 'clot-app-40847',
    storageBucket: 'clot-app-40847.firebasestorage.app',
    iosBundleId: 'com.example.clotApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3mtO1WyaOtYxMTs-dB_Gi3PiCG8zWDII',
    appId: '1:966942504507:ios:3da9663604c0b498dc0e1e',
    messagingSenderId: '966942504507',
    projectId: 'clot-app-40847',
    storageBucket: 'clot-app-40847.firebasestorage.app',
    iosBundleId: 'com.example.clotApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBEpqYW395WtxcnVfolt1Br3E29qdSPX7M',
    appId: '1:966942504507:web:d3aa7b20d634e39ddc0e1e',
    messagingSenderId: '966942504507',
    projectId: 'clot-app-40847',
    authDomain: 'clot-app-40847.firebaseapp.com',
    storageBucket: 'clot-app-40847.firebasestorage.app',
    measurementId: 'G-6LYVR882LB',
  );
}
