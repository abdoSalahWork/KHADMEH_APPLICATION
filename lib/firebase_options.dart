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
    apiKey: 'AIzaSyDq1Egf2gaRF5Rwd2Pj1ff-neFkYVbNnjo',
    appId: '1:705392766739:android:86be2101e214c801ed74e6',
    messagingSenderId: '705392766739',
    projectId: 'khedma-92ce7',
    storageBucket: 'khedma-92ce7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCjbTyCfIMqcD9rgXHpoPRXQjMTtKo9XwY',
    appId: '1:705392766739:ios:46c25209c30ef195ed74e6',
    messagingSenderId: '705392766739',
    projectId: 'khedma-92ce7',
    storageBucket: 'khedma-92ce7.appspot.com',
    androidClientId: '705392766739-kaluo3fn755vdgrq4e37khk0e9hrqs7b.apps.googleusercontent.com',
    iosClientId: '705392766739-pm24lqml7o30s948lnv49euioq5kit4v.apps.googleusercontent.com',
    iosBundleId: 'com.dropidea.khedma',
  );
}
