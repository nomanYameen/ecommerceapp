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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCw_hVRwcZNlYbaHjru_joELjPnL-9gqHs',
    appId: '1:323392440936:android:b02557731c5d3de3f949dd',
    messagingSenderId: '323392440936',
    projectId: 'friends-hive-chat',
    storageBucket: 'friends-hive-chat.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB4s9JsK9kOmH83rBaNej-kHz47ZTXfkXM',
    appId: '1:323392440936:ios:dde6216a7de5641bf949dd',
    messagingSenderId: '323392440936',
    projectId: 'friends-hive-chat',
    storageBucket: 'friends-hive-chat.appspot.com',
    androidClientId: '323392440936-cv8i2cpfddphcuh3mmjoimkuvk8o6hb4.apps.googleusercontent.com',
    iosClientId: '323392440936-56n90a0p030ldq35outq0n0dr9hg249l.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce',
  );
}
