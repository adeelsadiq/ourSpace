import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (Platform.isIOS) {
    // iOS and MacOS

    log("HALLLOSOSS");
    return Firebase.initializeApp(
        options: const FirebaseOptions(
      appId: '1:279631615180:ios:6a74322fc1dece8207de69',
      apiKey: 'AIzaSyCOF1LidYj07rxZrXVSt-yGTTWdmdDqdVU',
      storageBucket: "flutter-practice-119dc.appspot.com",
      projectId: 'flutter-practice-119dc',
      messagingSenderId: '279631615180',
      iosBundleId: 'com.mycompany.flutterpractice',
    ));
  } else if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDWwxq-6kAZQl7ABysDdHSGoSY9KSPtLL0",
            authDomain: "flutter-practice-119dc.firebaseapp.com",
            projectId: "flutter-practice-119dc",
            storageBucket: "flutter-practice-119dc.appspot.com",
            messagingSenderId: "279631615180",
            appId: "1:279631615180:web:9cb8e86b84f3124e07de69"));
  } else {
    print("Firebse Else");
    await Firebase.initializeApp();
  }
}
