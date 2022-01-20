import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  // get the userToken
  Stream<User?> get authStateChanges {
    return _firebaseAuth.idTokenChanges();
  }

  // get the user signout
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // get the user sign in
  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      // check if the user exit with these email and password
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return e.message.toString();
    }
  }

  // add to new user to the firebase authentication service
  Future<String> signUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return e.message.toString();
    }
  }
}
