import 'package:clot_app/core/services/firebase_auth_service.dart';
import 'package:clot_app/features/login/data/models/login_request_body.dart';

class LoginRepoImpl {
  final FirebaseAuthService _firebaseAuth;

  LoginRepoImpl(this._firebaseAuth);

  Future<void> loginWithEmailAndPassword({
    required LoginRequestBody loginRequestBody,
  }) async {
    await _firebaseAuth.loginWithEmailAndPassword(loginRequestBody);
  }

  Future<void> loginWithGoogle() async {
    await _firebaseAuth.loginWithGoogle();

    // await _firebaseStoreService.addUserData(user.user!.uid, {
    //   'email': user.user?.email,
    //   'fullname': user.user?.displayName,
    // });
  }

  Future<void> loginWithFacebook() async {
    await _firebaseAuth.loginWithFacebook();
  }
}
