import 'package:clot_app/core/apis_helpers/api_error_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApiErrorHandler implements Exception {
  static ApiErrorModel handel(dynamic error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'user-not-found':
          throw ApiErrorModel(message: 'No user found for that email.');
        case 'wrong-password':
          throw ApiErrorModel(
            message: 'Wrong password provided for that user.',
          );
        case 'invalid-email':
          throw ApiErrorModel(message: 'Invalid email address.');
        case 'user-disabled':
          throw ApiErrorModel(message: 'This user account has been disabled.');
        case 'too-many-requests':
          throw ApiErrorModel(
            message: 'Too many login attempts. Please try again later.',
          );
        case 'operation-not-allowed':
          throw ApiErrorModel(
            message: 'Email/password sign-in is not enabled.',
          );
        case 'account-exists-with-different-credential':
          throw ApiErrorModel(
            message: 'Account exists with a different credential.',
          );
        case 'invalid-credential':
          throw ApiErrorModel(
            message: 'The credential data is malformed or has expired.',
          );
        case 'network-request-failed':
          throw ApiErrorModel(
            message: 'Network request failed. Please check your connection.',
          );
        case 'auth/invalid-verification-code':
          throw ApiErrorModel(message: 'The verification code is invalid.');
        case 'weak-password':
          throw ApiErrorModel(message: 'The password provided is too weak.');
        case 'email-already-in-use':
          throw ApiErrorModel(
            message: 'The email address is already in use by another account.',
          );

        case 'admin-restricted-operation':
          throw ApiErrorModel(
            message: 'This operation is restricted to administrators only.',
          );

        default:
          throw ApiErrorModel(message: error.message ?? 'Something went wrong');
      }
    } else {
      throw ApiErrorModel(message: 'Unknown error occurred');
    }
  }
}
