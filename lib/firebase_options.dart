import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTDuStK4AUNjYFXBPCC_s7MsOQLOin_4E',
    appId: '1:781091741498:android:c3a6737b6fa1fb98237a03',
    messagingSenderId: '781091741498',
    projectId: 'my-flutter-app-de94b',
    storageBucket: 'my-flutter-app-de94b.appspot.com',
  );
}
