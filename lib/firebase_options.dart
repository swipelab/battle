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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCpFbNt8A93Sc71Zo_qUKs7zGfyCPpCrCs',
    appId: '1:815667628944:web:aa59c3a724c4d858d24115',
    messagingSenderId: '815667628944',
    projectId: 'co-swipelab-battle',
    authDomain: 'co-swipelab-battle.firebaseapp.com',
    storageBucket: 'co-swipelab-battle.appspot.com',
    measurementId: 'G-9YG2DJ6J41',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCo4hnZmk3kg53XHwv88dsofYldodYtIE',
    appId: '1:815667628944:android:8b8c16f1ad8f7d71d24115',
    messagingSenderId: '815667628944',
    projectId: 'co-swipelab-battle',
    storageBucket: 'co-swipelab-battle.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyATrvzYt0KLQ6PTdZt31-W6lmGloGKh0n4',
    appId: '1:815667628944:ios:783334526fa5f892d24115',
    messagingSenderId: '815667628944',
    projectId: 'co-swipelab-battle',
    storageBucket: 'co-swipelab-battle.appspot.com',
    iosClientId: '815667628944-mkaj5o3ca6ci6id38pj44l629ii3reqv.apps.googleusercontent.com',
    iosBundleId: 'co.swipelab.battle.battle',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyATrvzYt0KLQ6PTdZt31-W6lmGloGKh0n4',
    appId: '1:815667628944:ios:783334526fa5f892d24115',
    messagingSenderId: '815667628944',
    projectId: 'co-swipelab-battle',
    storageBucket: 'co-swipelab-battle.appspot.com',
    iosClientId: '815667628944-mkaj5o3ca6ci6id38pj44l629ii3reqv.apps.googleusercontent.com',
    iosBundleId: 'co.swipelab.battle.battle',
  );
}