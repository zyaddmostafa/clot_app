import 'dart:developer';

import 'package:clot_app/core/utils/app_regex.dart';
import 'package:clot_app/core/utils/firebase_auth_error_handler.dart';
import 'package:clot_app/core/widgets/error_message.dart';
import 'package:clot_app/features/login/data/models/login_request_body.dart';
import 'package:clot_app/features/signup/data/models/sign_up_request_body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get current user
  User? get currentUser => _firebaseAuth.currentUser;

  // Stream of auth state changes
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
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
      FirebaseAuthErrorHandler.handleAuthException(
        e,
        'signUpWithEmailAndPassword',
      );
      rethrow;
    } catch (e) {
      FirebaseAuthErrorHandler.handleGeneralException(
        e,
        'signUpWithEmailAndPassword',
      );
      rethrow;
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
      FirebaseAuthErrorHandler.handleAuthException(
        e,
        'loginWithEmailAndPassword',
      );
    } catch (e) {
      log('FirebaseAuthService: loginWithEmailAndPassword: $e');
      throw const ErrorMessage(message: 'Something went wrong!');
    }
  }

  Future<UserCredential> loginWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        throw const ErrorMessage(message: 'Google sign-in was cancelled');
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Sign in with the credential
      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );

      // Save user data to Firestore using the existing store service
      if (userCredential.user != null) {
        await _saveUserDataToFirestore(userCredential.user!, 'google');
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      log('Google login error: ${e.code} - ${e.message}');
      throw ErrorMessage(message: AppRegex.getFirebaseAuthErrorMessage(e.code));
    } catch (e) {
      log('Google login general error: $e');
      throw const ErrorMessage(
        message: 'Something went wrong with Google sign-in',
      );
    }
  }

  Future<UserCredential> loginWithFacebook() async {
    // Trigger the sign-in flow
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      // Once signed in, return the UserCredential
      final userCredential = await _firebaseAuth.signInWithCredential(
        facebookAuthCredential,
      );
      if (userCredential.user != null) {
        await _saveUserDataToFirestore(userCredential.user!, 'Facebook');
      }

      return userCredential;
    } catch (e) {
      print('Error signing in with Google: $e');
      rethrow;
    }
  }

  Future<void> _saveUserDataToFirestore(User user, String provider) async {
    try {
      await _firestore.collection('users').doc(user.uid).set(
        {
          'uid': user.uid,
          'email': user.email,
          'displayName': user.displayName,
          'photoURL': user.photoURL,
          'createdAt': FieldValue.serverTimestamp(),
          'provider': provider,
          // Add any other fields you want to store
        },
        SetOptions(merge: true),
      ); // Use merge to avoid overwriting existing data
    } catch (e) {
      print('Error saving user data: $e');
    }
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
      FirebaseAuthErrorHandler.handleGeneralException(e, 'getCurrentUser');
      return null;
    }
  }

  // get user id
  String getCurrentUserId() {
    try {
      return _firebaseAuth.currentUser!.uid;
    } catch (e) {
      FirebaseAuthErrorHandler.handleGeneralException(e, 'getCurrentUserId');
      return '';
    }
  }
}
