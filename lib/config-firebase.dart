import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    /// if you want configuration for web from here
    /// and fill your data from web's google-services.json file ///
    // if (kIsWeb) {
    //   // Web
    //   return const FirebaseOptions(
    //     apiKey: '',
    //     authDomain: '',
    //     databaseURL:'',
    //     projectId: '',
    //     storageBucket: '',
    //     messagingSenderId: '',
    //     appId: '',
    //     measurementId: '',
    //   );

    /// also if you wont configuration for IOS from here
    /// and fill your data from IOS's google-services.json file ///
    // } else if (Platform.isIOS || Platform.isMacOS) {
    //   // iOS and MacOS
    //   return const FirebaseOptions(
    //     apiKey: '',
    //     authDomain: '',
    //     databaseURL:'',
    //     projectId: '',
    //     storageBucket: '',
    //     messagingSenderId: '',
    //     appId: '',
    //     measurementId: '',
    //   );
    // } else {
    //   // Android

    /// To do change your data from google-services.json file ///
    /// in this configuration we work for android only  ///
    return const FirebaseOptions(
      appId: '1:488432009966:android:d1a85bdd3cf111d59fe9ff',
      apiKey: 'AIzaSyBwR_ZmMpjY_27e7En7Oad0AXTciWOkcLY',
      projectId: 'odella-f86e7',
      androidClientId:
      '488432009966-3gi8ffms3hvpu6gprdrtlra1pd444fp4.apps.googleusercontent.com',
      // we can find it from firebase/project setting /  Cloud Messaging
      messagingSenderId: '488432009966',
      // we can find it from firebase/ Authentication /Sign-in method
      authDomain: 'push-notivication-224bc.firebaseapp.com',
    );
    // }
  }
}
