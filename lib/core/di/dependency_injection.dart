import 'package:clot_app/core/services/firebase_auth_service.dart';
import 'package:clot_app/core/services/firebase_store_service.dart';
import 'package:clot_app/features/login/data/repos/login_repo.dart';
import 'package:clot_app/features/signup/data/repos/sign_up_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Register your services and repositories here
  // Example:
  getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
  getIt.registerLazySingleton<FirebaseStoreService>(
    () => FirebaseStoreService(),
  );
  // signup
  getIt.registerLazySingleton<SignUpRepo>(
    () =>
        SignUpRepo(getIt<FirebaseAuthService>(), getIt<FirebaseStoreService>()),
  );
  // login
  getIt.registerLazySingleton<LoginRepo>(
    () =>
        LoginRepo(getIt<FirebaseAuthService>(), getIt<FirebaseStoreService>()),
  );

  // Add other dependencies as needed
}
