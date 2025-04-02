import 'package:clot_app/core/di/dependency_injection.dart';
import 'package:clot_app/core/routing/app_routes.dart';
import 'package:clot_app/core/routing/routes.dart';
import 'package:clot_app/core/services/firebase_auth_service.dart';
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
        theme: ThemeData(
          primaryColor: const Color(0xFF8E6CEF),
          scaffoldBackgroundColor: Colors.white,
        ),

        initialRoute:
            getIt<FirebaseAuthService>().isLoggedIn()
                ? Routes.homeScreen
                : Routes.loginScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
