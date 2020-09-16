import 'package:firebase_auth/firebase_auth.dart';
import 'package:sercy/backend/database.dart';

class AuthManager {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  isNewUser() async {
    var authResult = await _auth.signInAnonymously();
    print(authResult.additionalUserInfo.isNewUser);
    return authResult.additionalUserInfo.isNewUser;
  }

  signInWithEmail(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  signInAnonymously() async {
    await _auth.signInAnonymously();
  }

  String getUID() {
    String uid = _auth.currentUser.uid;
    if (uid != null) return uid;
    return 'null';
  }
}
