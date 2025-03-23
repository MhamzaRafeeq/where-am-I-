import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAfq-rekYBmMog4QjF6Q_pjEjpTRT51SKQ",
            authDomain: "nearme-82c68.firebaseapp.com",
            projectId: "nearme-82c68",
            storageBucket: "nearme-82c68.appspot.com",
            messagingSenderId: "447986839640",
            appId: "1:447986839640:web:e38c77961695f330e75a2d",
            measurementId: "G-S0R9P4Z0VW"));
  } else {
    await Firebase.initializeApp();
  }
}
