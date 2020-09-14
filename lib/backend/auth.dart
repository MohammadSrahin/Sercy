import 'package:firebase_auth/firebase_auth.dart';

class AuthManager {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  signInAnonymously() async {
    await _auth.signInAnonymously();
  }

  String getUID() {
    String uid = _auth.currentUser.uid;
    return uid;
  }
}
