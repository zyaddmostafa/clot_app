import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:clot_app/features/cart/presentation/widgets/cart_product_list_view.dart';
import 'package:clot_app/features/cart/presentation/widgets/empty_cart.dart';
import 'package:clot_app/features/cart/presentation/widgets/shimmer_cart_product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductBlocConsumer extends StatelessWidget {
  const CartProductBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listenWhen:
          (previous, current) =>
              current is RemoveFromCartSuccess || current is ClearCartSuccess,
      listener: (context, state) {
        if (state is RemoveFromCartSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item removed from cart'),
              duration: Duration(seconds: 2),
            ),
          );
          // Refresh cart items
          context.read<CartCubit>().getCartItems();
        } else if (state is ClearCartSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cart cleared'),
              duration: Duration(seconds: 2),
            ),
          );
          // Refresh cart items
          context.read<CartCubit>().getCartItems();
        }
      },
      buildWhen:
          (previous, current) =>
              current is GetCartItemsLoading ||
              current is GetCartItemsSuccess ||
              current is GetCartItemsError ||
              current is RemoveFromCartSuccess ||
              current is ClearCartSuccess,
      builder: (context, state) {
        if (state is GetCartItemsLoading) {
          return const ShimmerCartProductListView(itemCount: 3);
        } else if (state is GetCartItemsSuccess) {
          if (state.cartItems.isEmpty) {
            return const Expanded(child: EmptyCart());
          }
          return CartProductListView(cartlist: state.cartItems);
        } else if (state is GetCartItemsError) {
          return Expanded(
            child: Center(
              child: Text(state.errorMessage, style: AppTextStyles.font14Bold),
            ),
          );
        } else if (state is RemoveFromCartSuccess ||
            state is ClearCartSuccess) {
          // Show loading until getCartItems completes
          return const Expanded(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return const Expanded(
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
