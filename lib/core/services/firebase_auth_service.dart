import 'dart:developer';

import 'package:clot_app/core/widgets/error_message.dart';
import 'package:clot_app/features/signup/data/models/sign_up_request_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User> signUpWithEmailAndPassword({
    required SignUpRequestBody signUpRequestBody,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: signUpRequestBody.email,
        password: signUpRequestBody.password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'FirebaseAuthService: signUpWithEmailAndPassword: FirebaseAuthException: $e',
      );
      if (e.code == 'weak-password') {
        throw const ErrorMessage(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw const ErrorMessage(
          message: 'The account already exists for that email.',
        );
      } else {
        throw const ErrorMessage(message: 'Something went wrong!');
      }
    } catch (e) {
      throw const ErrorMessage(message: 'Something went wrong!');
    }
  }

  Future<void> signOut() async => await _firebaseAuth.signOut();
  Future<void> deleteUser() => _firebaseAuth.currentUser!.delete();

  Future<User?> getCurrentUser() async {
    try {
      return _firebaseAuth.currentUser;
    } catch (e) {
      log('FirebaseAuthService: getCurrentUser: $e');
      return null;
    }
  }

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw const ErrorMessage(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw const ErrorMessage(
          message: 'Wrong password provided for that user.',
        );
      } else if (e.code == 'invalid-email') {
        throw const ErrorMessage(message: 'Invalid email address.');
      } else {
        throw const ErrorMessage(message: 'Something went wrong!');
      }
    }
  }

  Future<User> loginWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await _firebaseAuth.signInWithCredential(credential)).user!;
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  Future<User> loginWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }
}
