import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBr-lzaOK_-TLD8qR8_tbGI5_cuYuW43-k",
            authDomain: "heritagehues-d2a03.firebaseapp.com",
            projectId: "heritagehues-d2a03",
            storageBucket: "heritagehues-d2a03.appspot.com",
            messagingSenderId: "77845899902",
            appId: "1:77845899902:web:abcc4256384e20ec86062f",
            measurementId: "G-MHWDH8P4GE"));
  } else {
    await Firebase.initializeApp();
  }
}
