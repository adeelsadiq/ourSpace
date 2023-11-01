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
      appId: '',
      apiKey: '<add your API key>',
      storageBucket: "",
      projectId: '<add your project-Id>',
      messagingSenderId: '279631615180',
      iosBundleId: '<add your isoBundleId>',
    ));
  } else if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "<add your API key>",
            authDomain: "flutter-practice-119dc.firebaseapp.com",
            projectId: "<add your project-Id>",
            storageBucket: "flutter-practice-119dc.appspot.com",
            messagingSenderId: "279631615180",
            appId: ""));
  } else {
    print("Firebse Else");
    await Firebase.initializeApp();
  }
}
