import 'package:clot_app/core/di/dependency_injection.dart';
import 'package:clot_app/core/routing/routes.dart';
import 'package:clot_app/features/home/data/repo/home_repo_impl.dart';
import 'package:clot_app/features/home/ui/screens/category_products_screen.dart';
import 'package:clot_app/features/home/ui/cubit/home_cubit.dart';
import 'package:clot_app/features/home/ui/screens/home_screen.dart';
import 'package:clot_app/features/home/ui/screens/see_all_products_screen.dart';
import 'package:clot_app/features/home/ui/screens/shop_by_categories_screen.dart';
import 'package:clot_app/features/login/data/repos/login_repo_impl.dart';
import 'package:clot_app/features/login/ui/cubits/login_cubit/login_cubit.dart';
import 'package:clot_app/features/login/ui/login_screen.dart';
import 'package:clot_app/features/signup/data/repos/sign_up_repo_impl.dart';
import 'package:clot_app/features/signup/ui/cubits/signup/sign_up_cubit.dart';
import 'package:clot_app/features/signup/ui/sign_up_screen.dart';
import 'package:clot_app/main_layout.dart';
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
      // case Routes.homeScreen:
      //   return MaterialPageRoute(
      //     builder:
      //         (_) => BlocProvider(
      //           create:
      //               (context) =>
      //                   HomeCubit(getIt<HomeRepoImpl>())
      //                     ..getCategories()
      //                     ..getProduct(),
      //           child: const HomeScreen(),
      //         ),
      //   );
      case Routes.shopByCategoriesScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        HomeCubit(getIt<HomeRepoImpl>())..getCategories(),
                child: const ShopByCategoriesScreen(),
              ),
        );
      case Routes.categoryProductsScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        HomeCubit(getIt<HomeRepoImpl>())
                          ..getFilterProduct(argument),
                child: CategoryProductsScreen(categoryName: argument as String),
              ),
        );

      case Routes.seeAllProductsScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) => HomeCubit(getIt<HomeRepoImpl>())..getProduct(),
                child: SeeAllProductsScreen(categoryName: argument as String),
              ),
        );
      case Routes.mainLayout: // Add this new route
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        HomeCubit(getIt<HomeRepoImpl>())
                          ..getCategories()
                          ..getProduct(),
                child: const MainLayout(),
              ),
        );
      default:
        return null;
    }
  }
}
