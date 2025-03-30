import 'dart:developer';

import 'package:clot_app/core/widgets/error_message.dart';
import 'package:clot_app/features/signup/data/models/sign_up_request_body.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
        print('The password provided is too weak.');
        throw const ErrorMessage(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        throw const ErrorMessage(
          message: 'The account already exists for that email.',
        );
      } else {
        print('Something went wrong!');
        throw const ErrorMessage(message: 'Something went wrong!');
      }
    } catch (e) {
      print(e);
      throw const ErrorMessage(message: 'Something went wrong!');
    }
  }
}
