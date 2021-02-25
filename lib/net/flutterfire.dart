import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> register(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak password') {
      print('This password is too weak.  please do better.');
    } else if (e.code == 'email-already-in-use') {
      print('the account already exosts for that email');
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}
