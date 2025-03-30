import 'package:clot_app/core/services/firebase_auth_service.dart';
import 'package:clot_app/features/signup/data/models/sign_up_request_body.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepo {
  final FirebaseAuthService _firebaseAuthService;

  SignUpRepo(this._firebaseAuthService);

  Future<void> signUpWithEmailAndPassword({
    required SignUpRequestBody signUpRequestBody,
  }) async {
    User? user;
    user = await _firebaseAuthService.signUpWithEmailAndPassword(
      signUpRequestBody: signUpRequestBody,
    );
  }
}
