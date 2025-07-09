import 'package:clot_app/core/apis_helpers/api_error_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is FirebaseAuthException) {
      return handleFirebaseAuthException(error);
    } else if (error is FirebaseException) {
      return handleFirestoreException(error);
    } else if (error is Exception) {
      return ApiErrorModel(message: error.toString());
    } else {
      return ApiErrorModel(
        message: 'Unknown error occurred: ${error.toString()}',
      );
    }
  }

  static ApiErrorModel handleFirebaseAuthException(
    FirebaseAuthException error,
  ) {
    switch (error.code) {
      case 'user-not-found':
        return ApiErrorModel(message: 'No user found for that email.');
      case 'wrong-password':
        return ApiErrorModel(message: 'Wrong password provided for that user.');
      case 'invalid-email':
        return ApiErrorModel(message: 'Invalid email address.');
      case 'user-disabled':
        return ApiErrorModel(message: 'This user account has been disabled.');
      case 'too-many-requests':
        return ApiErrorModel(
          message: 'Too many login attempts. Please try again later.',
        );
      case 'operation-not-allowed':
        return ApiErrorModel(message: 'Email/password sign-in is not enabled.');
      case 'account-exists-with-different-credential':
        return ApiErrorModel(
          message: 'Account exists with a different credential.',
        );
      case 'invalid-credential':
        return ApiErrorModel(
          message: 'The credential data is malformed or has expired.',
        );
      case 'network-request-failed':
        return ApiErrorModel(
          message: 'Network request failed. Please check your connection.',
        );
      case 'invalid-verification-code':
        return ApiErrorModel(message: 'The verification code is invalid.');
      case 'weak-password':
        return ApiErrorModel(message: 'The password provided is too weak.');
      case 'email-already-in-use':
        return ApiErrorModel(
          message: 'The email address is already in use by another account.',
        );
      case 'admin-restricted-operation':
        return ApiErrorModel(
          message: 'This operation is restricted to administrators only.',
        );
      default:
        return ApiErrorModel(
          message: error.message ?? 'Authentication error occurred',
        );
    }
  }

  static ApiErrorModel handleFirestoreException(FirebaseException error) {
    switch (error.code) {
      case 'permission-denied':
        return ApiErrorModel(
          message: 'You do not have permission to access this data.',
        );
      case 'not-found':
        return ApiErrorModel(message: 'The requested document was not found.');
      case 'already-exists':
        return ApiErrorModel(message: 'The document already exists.');
      case 'resource-exhausted':
        return ApiErrorModel(
          message: 'Quota exceeded. Please try again later.',
        );
      case 'failed-precondition':
        return ApiErrorModel(
          message: 'Operation was rejected due to system state.',
        );
      case 'aborted':
        return ApiErrorModel(
          message: 'The operation was aborted due to a concurrency issue.',
        );
      case 'out-of-range':
        return ApiErrorModel(
          message: 'The operation was attempted past the valid range.',
        );
      case 'unimplemented':
        return ApiErrorModel(
          message: 'This operation is not implemented or supported.',
        );
      case 'internal':
        return ApiErrorModel(
          message: 'Internal server error. Please try again later.',
        );
      case 'unavailable':
        return ApiErrorModel(
          message: 'The service is temporarily unavailable. Please try again.',
        );
      case 'data-loss':
        return ApiErrorModel(message: 'Unrecoverable data loss or corruption.');
      case 'unauthenticated':
        return ApiErrorModel(
          message:
              'The request does not have valid authentication credentials.',
        );
      case 'invalid-argument':
        return ApiErrorModel(message: 'Invalid argument provided.');
      case 'deadline-exceeded':
        return ApiErrorModel(
          message: 'The operation took too long to complete.',
        );
      case 'cancelled':
        return ApiErrorModel(message: 'The operation was cancelled.');
      case 'unknown':
        return ApiErrorModel(message: 'An unknown error occurred.');
      default:
        return ApiErrorModel(
          message: error.message ?? 'Firestore error occurred',
        );
    }
  }
}
