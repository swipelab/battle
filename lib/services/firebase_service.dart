import 'package:app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stated/stated.dart';

class FirebaseService with AsyncInit {
  static Future<FirebaseService> create(Resolver resolver) async =>
      FirebaseService();

  @override
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
