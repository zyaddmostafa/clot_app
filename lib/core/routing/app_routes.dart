import 'package:clot_app/core/di/dependency_injection.dart';
import 'package:clot_app/core/routing/routes.dart';
import 'package:clot_app/features/cart/data/model/cart_product_response_model.dart';
import 'package:clot_app/features/cart/data/repo/cart_repo_impl.dart';
import 'package:clot_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:clot_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:clot_app/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:clot_app/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:clot_app/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:clot_app/features/checkout/presentation/screens/order_placed_screen.dart';
import 'package:clot_app/features/home/data/repo/home_repo_impl.dart';
import 'package:clot_app/features/home/ui/screens/category_products_screen.dart';
import 'package:clot_app/features/home/ui/cubit/home_cubit/home_cubit.dart';
import 'package:clot_app/features/home/ui/screens/home_screen.dart';
import 'package:clot_app/features/home/ui/screens/see_all_products_screen.dart';
import 'package:clot_app/features/home/ui/screens/shop_by_categories_screen.dart';
import 'package:clot_app/features/login/data/repos/login_repo_impl.dart';
import 'package:clot_app/features/login/ui/cubits/login_cubit/login_cubit.dart';
import 'package:clot_app/features/login/ui/login_screen.dart';
import 'package:clot_app/features/profile/presentation/screens/order_history_screen.dart';
import 'package:clot_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:clot_app/features/signup/data/repos/sign_up_repo_impl.dart';
import 'package:clot_app/features/signup/ui/cubits/signup/sign_up_cubit.dart';
import 'package:clot_app/features/signup/ui/sign_up_screen.dart';
import 'package:clot_app/features/wishlist/data/repos/wish_list_repo_impl.dart';
import 'package:clot_app/features/wishlist/presentation/cubit/wish_list_cubit.dart';
import 'package:clot_app/features/wishlist/presentation/screens/wish_list_screen.dart';
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
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (context) =>
                            HomeCubit(getIt<HomeRepoImpl>())
                              ..getCategories()
                              ..getProduct(),
                  ),
                  BlocProvider(
                    create:
                        (context) => WishListCubit(getIt<WishListRepoImpl>()),
                  ),
                ],
                child: const HomeScreen(),
              ),
        );
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
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (context) =>
                            HomeCubit(getIt<HomeRepoImpl>())
                              ..getFilterProduct(argument as String),
                  ),
                  BlocProvider(
                    create:
                        (context) => WishListCubit(getIt<WishListRepoImpl>()),
                  ),
                ],
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
      case Routes.cartScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        CartCubit(getIt<CartRepoImpl>())..getCartItems(),
                child: const CartScreen(),
              ),
        );

      case Routes.checkoutScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => CheckoutCubit(getIt<CheckoutRepoImpl>()),
                child: CheckoutScreen(
                  cartItems: argument as List<CartProductResponseModel>,
                ),
              ),
        );
      case Routes.orderPlaced:
        return MaterialPageRoute(builder: (_) => const OrderPlacedScreen());

      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(popButtonVisible: true),
        );
      case Routes.wishListScreen:
        return MaterialPageRoute(
          builder: (_) => const WishListScreen(popButtonVisible: true),
        );

      case Routes.orderHistoryScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        CheckoutCubit(getIt<CheckoutRepoImpl>())
                          ..getAllOrders(),
                child: const OrderHistoryScreen(),
              ),
        );
      default:
        return null;
    }
  }
}
