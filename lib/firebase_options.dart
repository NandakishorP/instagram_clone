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
    apiKey: 'AIzaSyB1QB-C5W3D9PJRtMUllUYNxLmYZjo0b9k',
    appId: '1:771580698391:web:55b959adf50acfe21ba152',
    messagingSenderId: '771580698391',
    projectId: 'instagram-clone-333bd',
    authDomain: 'instagram-clone-333bd.firebaseapp.com',
    storageBucket: 'instagram-clone-333bd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBAPt1qGB4zsf-quKrSb1bzKHFvDwzWNYk',
    appId: '1:771580698391:android:7c5c37a156ca918b1ba152',
    messagingSenderId: '771580698391',
    projectId: 'instagram-clone-333bd',
    storageBucket: 'instagram-clone-333bd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBtoE3K95Y54_YUISONzOjrot7uDemAh7U',
    appId: '1:771580698391:ios:ae061f9eea58be131ba152',
    messagingSenderId: '771580698391',
    projectId: 'instagram-clone-333bd',
    storageBucket: 'instagram-clone-333bd.appspot.com',
    iosClientId:
        '771580698391-l9v2pc0q8nk2eo7rof5sdb39a4eiaq92.apps.googleusercontent.com',
    iosBundleId: 'com.example.instagramClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBtoE3K95Y54_YUISONzOjrot7uDemAh7U',
    appId: '1:771580698391:ios:0904d068432480f11ba152',
    messagingSenderId: '771580698391',
    projectId: 'instagram-clone-333bd',
    storageBucket: 'instagram-clone-333bd.appspot.com',
    iosClientId:
        '771580698391-5ahrbfffhlh58ecuuvv0ke9vc9uba92o.apps.googleusercontent.com',
    iosBundleId: 'com.example.instagramClone.RunnerTests',
  );
}
