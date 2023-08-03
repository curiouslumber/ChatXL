import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCXa3pTs5v8CofdmRJoC8-JentUaPW5CWk',
    appId: '1:268057645035:web:645f0b8b0f8ee4247453ae',
    messagingSenderId: '268057645035',
    projectId: 'chatdb-47',
    authDomain: 'chatdb-47.firebaseapp.com',
    storageBucket: 'chatdb-47.appspot.com',
    measurementId: 'G-9ZQGCB4QPL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAInnWwYJf1MIABEHC5y9K0GrO6vu_bsho',
    appId: '1:268057645035:android:8bc3bd6e6566db0a7453ae',
    messagingSenderId: '268057645035',
    projectId: 'chatdb-47',
    storageBucket: 'chatdb-47.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEB1q1FRYuTPVesCzDgPU-wFZvugOX6QA',
    appId: '1:268057645035:ios:f157baa36ef4a9857453ae',
    messagingSenderId: '268057645035',
    projectId: 'chatdb-47',
    storageBucket: 'chatdb-47.appspot.com',
    androidClientId:
        '268057645035-h7a1c30pnc9rvf7r10d2hkengqc1592d.apps.googleusercontent.com',
    iosClientId:
        '268057645035-91cbpg4ff5dnq30cjbub7r390qgs5o69.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatdb',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBEB1q1FRYuTPVesCzDgPU-wFZvugOX6QA',
    appId: '1:268057645035:ios:6f6088a9df09b42d7453ae',
    messagingSenderId: '268057645035',
    projectId: 'chatdb-47',
    storageBucket: 'chatdb-47.appspot.com',
    androidClientId:
        '268057645035-h7a1c30pnc9rvf7r10d2hkengqc1592d.apps.googleusercontent.com',
    iosClientId:
        '268057645035-vkdhh1t8rg528b945isamqfae2skdo8t.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatdb.RunnerTests',
  );
}
