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
    apiKey: 'AIzaSyCzGdo__40aXDEQxkk5HRTeTVI9t_7xTsw',
    appId: '1:503109356611:web:2b516aabf1c1af4062d8f6',
    messagingSenderId: '503109356611',
    projectId: 'fcmnotification-77c49',
    authDomain: 'fcmnotification-77c49.firebaseapp.com',
    storageBucket: 'fcmnotification-77c49.appspot.com',
    measurementId: 'G-B01S5ZJPTE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAavz_sBrpybX3NSMeHf1zWMnXMkTjM6Yk',
    appId: '1:503109356611:android:d8e2e8c9cb37b91462d8f6',
    messagingSenderId: '503109356611',
    projectId: 'fcmnotification-77c49',
    storageBucket: 'fcmnotification-77c49.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAch5RLU_uu7AQhiqVtByu7tJ5yGytR7iE',
    appId: '1:503109356611:ios:aae77abc8eec6b7862d8f6',
    messagingSenderId: '503109356611',
    projectId: 'fcmnotification-77c49',
    storageBucket: 'fcmnotification-77c49.appspot.com',
    iosClientId: '503109356611-3rclgele36fvi1ruo8ml5a0m5o37aim1.apps.googleusercontent.com',
    iosBundleId: 'com.example.fcmNotification',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAch5RLU_uu7AQhiqVtByu7tJ5yGytR7iE',
    appId: '1:503109356611:ios:aae77abc8eec6b7862d8f6',
    messagingSenderId: '503109356611',
    projectId: 'fcmnotification-77c49',
    storageBucket: 'fcmnotification-77c49.appspot.com',
    iosClientId: '503109356611-3rclgele36fvi1ruo8ml5a0m5o37aim1.apps.googleusercontent.com',
    iosBundleId: 'com.example.fcmNotification',
  );
}