// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:cloud_walk_test/configurations/environment_config.dart';
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
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: EnvironmentConfig.googleXApiKeyAndroid,
    appId: '1:831527760304:android:c2d72eb8122ed1310de675',
    messagingSenderId: '831527760304',
    projectId: 'cloud-walk-test',
    storageBucket: 'cloud-walk-test.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: EnvironmentConfig.googleXApiKeyIOS,
    appId: '1:831527760304:ios:c9a64cf9ab54acb30de675',
    messagingSenderId: '831527760304',
    projectId: 'cloud-walk-test',
    storageBucket: 'cloud-walk-test.appspot.com',
    iosBundleId: 'io.cloudwalk.cloudWalkTest',
  );
}
