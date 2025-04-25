import 'package:clot_app/core/di/dependency_injection.dart';
import 'package:clot_app/core/routing/app_routes.dart';
import 'package:clot_app/core/routing/routes.dart';
import 'package:clot_app/core/services/firebase_auth_service.dart';
import 'package:clot_app/core/themes/app_theme.dart';
import 'package:clot_app/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClotApp extends StatelessWidget {
  final AppRouter appRouter;
  const ClotApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,

      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: AppTheme().lightTheme,
        darkTheme: AppTheme().darkTheme,
        themeMode: ThemeMode.dark,

        initialRoute:
            getIt<FirebaseAuthService>().isLoggedIn()
                ? Routes.mainLayout
                : Routes.loginScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
