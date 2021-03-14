import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthManager {
  final FirebaseAuth _firebaseAuth;

  AuthManager(this._firebaseAuth);

  Stream<User> get authStateChange => _firebaseAuth.authStateChanges();
  String get userName => _firebaseAuth.currentUser.displayName;
  String get userEmail => _firebaseAuth.currentUser.email;

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> login(
      {@required String email, @required String password}) async {
    try {
      print('Calling');
      print(email);
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential.user.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return e.code;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return e.code;
      } else {
        return "Something Went Wrong";
      }
    }
  }

  Future<String> signUp(
      {@required String email, @required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      print('User created successfully');
      return userCredential.user.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return e.code;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return e.code;
      } else {
        return "Something Went Wrong";
      }
    } catch (e) {
      print(e);
      return e;
    }
  }
}
