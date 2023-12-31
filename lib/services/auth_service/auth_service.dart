import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../constants/constants.dart';

class AuthService {
  // AuthService._();
  // static AuthService instance = AuthService._();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Google Sign In
  Future<void> signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await _auth.signInWithCredential(credential);
        showMessage("Successfully signed in", Colors.green);
      }
    } catch (e) {
      throw Exception("Error signing in with google $e");
    }
  }

  /// Google Sign Out Functionality
  Future<void> handleSignOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      showMessage("Successfully signed out", Colors.green);
    } catch (e) {
      showMessage(
          getMessageFromErrorCode(
            e.toString(),
          ),
          Colors.red);
    }
  }

  Future<void> signUpWithEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      showMessage("Successfully signed up", Colors.green);
    } catch (e) {
      showMessage(
          getMessageFromErrorCode(
            e.toString(),
          ),
          Colors.red);
    }
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      showMessage("Successfully signed in", Colors.green);
    } catch (e) {
      showMessage(
          getMessageFromErrorCode(
            e.toString(),
          ),
          Colors.red);
    }
  }
}
