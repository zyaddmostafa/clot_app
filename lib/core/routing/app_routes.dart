import 'package:clot_app/core/routing/routes.dart';
import 'package:clot_app/features/login/ui/login_screen.dart';
import 'package:clot_app/features/signup/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      default:
        return null;
    }
  }
}
