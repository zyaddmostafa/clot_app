import 'package:clot_app/core/services/firebase_auth_service.dart';
import 'package:clot_app/core/services/firebase_store_service.dart';
import 'package:clot_app/features/home/data/repo/home_repo_impl.dart';
import 'package:clot_app/features/login/data/repos/login_repo_impl.dart';
import 'package:clot_app/features/signup/data/repos/sign_up_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // firebase services
  getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
  getIt.registerLazySingleton<FirebaseStoreService>(
    () => FirebaseStoreService(),
  );
  // signup
  getIt.registerLazySingleton<SignUpRepoImpl>(
    () => SignUpRepoImpl(
      getIt<FirebaseAuthService>(),
      getIt<FirebaseStoreService>(),
    ),
  );
  // login
  getIt.registerLazySingleton<LoginRepoImpl>(
    () => LoginRepoImpl(
      getIt<FirebaseAuthService>(),
      getIt<FirebaseStoreService>(),
    ),
  );

  // home repo
  getIt.registerLazySingleton<HomeRepoImpl>(
    () => HomeRepoImpl(firebaseStoreService: getIt<FirebaseStoreService>()),
  );

  // Add other dependencies as needed
}
