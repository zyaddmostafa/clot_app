import 'dart:developer';
import 'package:clot_app/core/widgets/error_message.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthErrorHandler {
  static ErrorMessage handleAuthException(
    FirebaseAuthException e,
    String operation,
  ) {
    log('FirebaseAuthService: $operation: ${e.code} - ${e.message}');

    switch (e.code) {
      // Common auth errors
      case 'invalid-email':
        return const ErrorMessage(message: 'Invalid email address.');
      case 'network-request-failed':
        return const ErrorMessage(
          message: 'A network error occurred. Please check your connection.',
        );
      case 'too-many-requests':
        return const ErrorMessage(
          message: 'Too many requests. Please try again later.',
        );
      case 'invalid-credential':
        return const ErrorMessage(
          message: 'The credential data is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const ErrorMessage(message: 'This operation is not allowed.');

      // Sign-up specific errors
      case 'weak-password':
        return const ErrorMessage(
          message: 'The password provided is too weak.',
        );
      case 'email-already-in-use':
        return const ErrorMessage(
          message: 'The account already exists for that email.',
        );
      case 'admin-restricted-operation':
        return const ErrorMessage(
          message: 'This operation is restricted to administrators only.',
        );

      // Sign-in specific errors
      case 'user-not-found':
        return const ErrorMessage(message: 'No user found for that email.');
      case 'wrong-password':
        return const ErrorMessage(
          message: 'Wrong password provided for that user.',
        );
      case 'user-disabled':
        return const ErrorMessage(
          message: 'This user account has been disabled.',
        );
      case 'account-exists-with-different-credential':
        return const ErrorMessage(
          message:
              'An account already exists with the same email address but different sign-in credentials.',
        );
      case 'auth/invalid-verification-code':
        return const ErrorMessage(message: 'The verification code is invalid.');

      default:
        return ErrorMessage(
          message: '$operation error: ${e.message ?? "Something went wrong."}',
        );
    }
  }

  static ErrorMessage handleGeneralException(dynamic e, String operation) {
    log('FirebaseAuthService: $operation: General exception: $e');
    return const ErrorMessage(message: 'Something went wrong!');
  }
}
