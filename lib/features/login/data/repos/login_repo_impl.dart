import 'package:clot_app/core/services/firebase_auth_service.dart';
import 'package:clot_app/core/services/firebase_store_service.dart';
import 'package:clot_app/features/login/data/models/login_request_body.dart';

class LoginRepoImpl {
  final FirebaseAuthService _firebaseAuth;
  final FirebaseStoreService _firebaseStoreService;
  LoginRepoImpl(this._firebaseAuth, this._firebaseStoreService);

  Future<void> loginWithEmailAndPassword({
    required LoginRequestBody loginRequestBody,
  }) async {
    await _firebaseAuth.loginWithEmailAndPassword(loginRequestBody);
  }

  Future<void> loginWithGoogle() async {
    final user = await _firebaseAuth.loginWithGoogle();

    // await _firebaseStoreService.addUserData(user.user!.uid, {
    //   'email': user.user?.email,
    //   'fullname': user.user?.displayName,
    // });
  }

  Future<void> loginWithFacebook() async {
    final user = await _firebaseAuth.loginWithFacebook();

    await _firebaseStoreService.addUserData(user.uid, {
      'email': user.email,
      'fullname': user.displayName,
    });
  }
}
