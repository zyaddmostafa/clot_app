import 'package:clot_app/core/di/dependency_injection.dart';
import 'package:clot_app/core/routing/routes.dart';
import 'package:clot_app/features/home/ui/home_screen.dart';
import 'package:clot_app/features/login/data/repos/login_repo_impl.dart';
import 'package:clot_app/features/login/ui/cubits/login_cubit/login_cubit.dart';
import 'package:clot_app/features/login/ui/login_screen.dart';
import 'package:clot_app/features/signup/data/repos/sign_up_repo_impl.dart';
import 'package:clot_app/features/signup/ui/cubits/signup/sign_up_cubit.dart';
import 'package:clot_app/features/signup/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => LoginCubit(getIt<LoginRepoImpl>()),
                child: const LoginScreen(),
              ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => SignUpCubit(getIt<SignUpRepoImpl>()),
                child: const SignUpScreen(),
              ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }
}
