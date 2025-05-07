import 'package:clot_app/core/di/dependency_injection.dart';
import 'package:clot_app/core/routing/app_routes.dart';
import 'package:clot_app/core/routing/routes.dart';
import 'package:clot_app/core/services/firebase_auth_service.dart';
import 'package:clot_app/core/themes/app_theme.dart';
import 'package:clot_app/features/home/ui/cubit/cubit/theme_cubit.dart';
import 'package:clot_app/features/wishlist/data/repos/wish_list_repo_impl.dart';
import 'package:clot_app/features/wishlist/presentation/cubit/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClotApp extends StatelessWidget {
  final AppRouter appRouter;
  const ClotApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDarkMode = state is ThemeLoaded ? state.isDarkMode : false;
        return BlocProvider(
          create:
              (context) =>
                  WishListCubit(getIt<WishListRepoImpl>())..loadWishlist(),
          child: ScreenUtilInit(
            designSize: const Size(390, 844),
            minTextAdapt: true,

            child: MaterialApp(
              debugShowCheckedModeBanner: false,

              theme: AppTheme().lightTheme,
              darkTheme: AppTheme().darkTheme,
              themeMode: !isDarkMode ? ThemeMode.dark : ThemeMode.light,

              initialRoute:
                  getIt<FirebaseAuthService>().currentUser == null
                      ? Routes.loginScreen
                      : Routes.mainLayout,

              onGenerateRoute: appRouter.generateRoute,
            ),
          ),
        );
      },
    );
  }
}
