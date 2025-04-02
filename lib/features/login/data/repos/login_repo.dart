import 'package:clot_app/core/services/firebase_auth_service.dart';
import 'package:clot_app/core/services/firebase_store_service.dart';
import 'package:clot_app/features/login/data/models/login_request_body.dart';

class LoginRepo {
  final FirebaseAuthService _firebaseAuth;
  final FirebaseStoreService _firebaseStoreService;
  LoginRepo(this._firebaseAuth, this._firebaseStoreService);

  Future<void> loginWithEmailAndPassword({
    required LoginRequestBody loginRequestBody,
  }) async {
    await _firebaseAuth.loginWithEmailAndPassword(
      email: loginRequestBody.email,
      password: loginRequestBody.password,
    );
  }

  Future<void> loginWithGoogle() async {
    final user = await _firebaseAuth.loginWithGoogle();

    await _firebaseStoreService.addUserData(user.uid, {
      'email': user.email,
      'name': user.displayName,
    });
  }

  Future<void> loginWithFacebook() async {
    final result = await _firebaseAuth.loginWithFacebook();

    await _firebaseStoreService.addUserData(result.uid, {
      'email': result.email,
      'name': result.displayName,
    });
  }
}
