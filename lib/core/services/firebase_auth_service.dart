import 'dart:developer';

import 'package:clot_app/core/widgets/error_message.dart';
import 'package:clot_app/features/login/data/models/login_request_body.dart';
import 'package:clot_app/features/signup/data/models/sign_up_request_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // firebase signup
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
        'FirebaseAuthService: signUpWithEmailAndPassword: ${e.code} - ${e.message}',
      );
      switch (e.code) {
        case 'weak-password':
          throw const ErrorMessage(
            message: 'The password provided is too weak.',
          );
        case 'email-already-in-use':
          throw const ErrorMessage(
            message: 'The account already exists for that email.',
          );
        case 'invalid-email':
          throw const ErrorMessage(message: 'Invalid email address.');
        case 'operation-not-allowed':
          throw const ErrorMessage(
            message: 'Email/password sign-up is not enabled.',
          );
        case 'network-request-failed':
          throw const ErrorMessage(
            message: 'A network error occurred. Please check your connection.',
          );
        case 'too-many-requests':
          throw const ErrorMessage(
            message: 'Too many requests. Please try again later.',
          );
        case 'admin-restricted-operation':
          throw const ErrorMessage(
            message: 'This operation is restricted to administrators only.',
          );
        case 'invalid-credential':
          throw const ErrorMessage(
            message: 'The credential data is malformed or has expired.',
          );
        default:
          throw ErrorMessage(
            message: 'Sign-up error: ${e.message ?? "Something went wrong."}',
          );
      }
    } catch (e) {
      log(
        'FirebaseAuthService: signUpWithEmailAndPassword: General exception: $e',
      );
      throw const ErrorMessage(message: 'Something went wrong!');
    }
  }

  // firebase login
  Future<void> loginWithEmailAndPassword(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: loginRequestBody.email,
        password: loginRequestBody.password,
      );
    } on FirebaseAuthException catch (e) {
      log('Firebase login error: ${e.code} - ${e.message}');
      switch (e.code) {
        case 'user-not-found':
          throw const ErrorMessage(message: 'No user found for that email.');
        case 'wrong-password':
          throw const ErrorMessage(
            message: 'Wrong password provided for that user.',
          );
        case 'invalid-email':
          throw const ErrorMessage(message: 'Invalid email address.');
        case 'user-disabled':
          throw const ErrorMessage(
            message: 'This user account has been disabled.',
          );
        case 'too-many-requests':
          throw const ErrorMessage(
            message: 'Too many login attempts. Please try again later.',
          );
        case 'operation-not-allowed':
          throw const ErrorMessage(
            message: 'Email/password sign-in is not enabled.',
          );
        case 'account-exists-with-different-credential':
          throw const ErrorMessage(
            message:
                'An account already exists with the same email address but different sign-in credentials.',
          );
        case 'invalid-credential':
          throw const ErrorMessage(
            message: 'The credential data is malformed or has expired.',
          );
        case 'network-request-failed':
          throw const ErrorMessage(
            message: 'A network error occurred. Please check your connection.',
          );
        case 'auth/invalid-verification-code':
          throw const ErrorMessage(
            message: 'The verification code is invalid.',
          );
        default:
          throw ErrorMessage(
            message:
                'Authentication error: ${e.message ?? "Something went wrong."}',
          );
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

  Future<User> loginWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await _firebaseAuth.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }

  // Check if the user is logged in
  bool isLoggedIn() {
    getCurrentUser();
    return _firebaseAuth.currentUser != null;
  }

  // user sign out
  Future<void> signOut() async => await _firebaseAuth.signOut();

  // user delete
  Future<void> deleteUser() => _firebaseAuth.currentUser!.delete();

  // get current user
  Future<User?> getCurrentUser() async {
    try {
      return _firebaseAuth.currentUser;
    } catch (e) {
      log('FirebaseAuthService: getCurrentUser: $e');
      return null;
    }
  }
}
