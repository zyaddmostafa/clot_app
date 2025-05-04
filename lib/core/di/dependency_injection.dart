import 'package:clot_app/core/services/firebase_auth_service.dart';
import 'package:clot_app/core/services/firebase_store_service.dart';
import 'package:clot_app/core/services/hive_service.dart';
import 'package:clot_app/features/cart/data/repo/cart_repo_impl.dart';
import 'package:clot_app/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:clot_app/features/home/data/repo/home_repo_impl.dart';
import 'package:clot_app/features/login/data/repos/login_repo_impl.dart';
import 'package:clot_app/features/signup/data/repos/sign_up_repo_impl.dart';
import 'package:clot_app/features/wishlist/data/repos/wish_list_repo_impl.dart';
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
    () => LoginRepoImpl(getIt<FirebaseAuthService>()),
  );

  // home repo
  getIt.registerLazySingleton<HomeRepoImpl>(
    () => HomeRepoImpl(firebaseStoreService: getIt<FirebaseStoreService>()),
  );

  // cart repo
  getIt.registerLazySingleton<CartRepoImpl>(
    () => CartRepoImpl(firebaseStoreService: getIt<FirebaseStoreService>()),
  );

  // checkout repo
  getIt.registerLazySingleton<CheckoutRepoImpl>(
    () => CheckoutRepoImpl(firebaseStoreService: getIt<FirebaseStoreService>()),
  );

  // hive
  getIt.registerFactory<HiveService>(() => HiveService());

  // wishlist repo
  getIt.registerLazySingleton<WishListRepoImpl>(
    () => WishListRepoImpl(hiveService: getIt<HiveService>()),
  );

  // Add other dependencies as needed
}
