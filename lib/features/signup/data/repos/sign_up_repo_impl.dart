import 'dart:developer';

import 'package:clot_app/core/services/firebase_auth_service.dart';
import 'package:clot_app/core/services/firebase_store_service.dart';
import 'package:clot_app/core/widgets/error_message.dart';
import 'package:clot_app/features/signup/data/models/sign_up_request_body.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepoImpl {
  final FirebaseAuthService _firebaseAuthService;
  final FirebaseStoreService _firebaseStoreService;
  SignUpRepoImpl(this._firebaseAuthService, this._firebaseStoreService);

  Future<void> signUpWithEmailAndPassword({
    required SignUpRequestBody signUpRequestBody,
  }) async {
    User? user;

    try {
      user = await _firebaseAuthService.signUpWithEmailAndPassword(
        signUpRequestBody: signUpRequestBody,
      );
      log(
        'from signUpRpo: signUpWithEmailAndPassword:${signUpRequestBody.toJson().toString()}',
      );

      await _firebaseStoreService.addUserData(user.uid, {
        'email': signUpRequestBody.email,
        'fullname': signUpRequestBody.fullName,
      });
    } on Exception catch (e) {
      _firebaseAuthService.deleteUser();
      log(e.toString());
      ErrorMessage(message: e.toString());
    }
  }
}
