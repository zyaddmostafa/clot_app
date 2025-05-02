import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/assets_images.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/core/widgets/pop_button.dart';
import 'package:clot_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:clot_app/features/cart/presentation/widgets/cart_product_list_view.dart';
import 'package:clot_app/features/cart/presentation/widgets/checkout_button.dart';
import 'package:clot_app/features/cart/presentation/widgets/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              // App Bar
              Row(
                children: [
                  const PopButton(),
                  SizedBox(width: 110.w),
                  const Text('Cart', style: AppTextStyles.font16Bold),
                ],
              ),
              verticalSpace(24),

              // Remove All Button
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // Clear all items from cart
                    context.read<CartCubit>().clearCart();
                  },
                  child: const Text(
                    'Remove all items',
                    style: AppTextStyles.font16Bold,
                  ),
                ),
              ),
              verticalSpace(16),

              // Cart Items List
              BlocConsumer<CartCubit, CartState>(
                listenWhen:
                    (previous, current) =>
                        current is RemoveFromCartSuccess ||
                        current is ClearCartSuccess,
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
                    return const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is GetCartItemsSuccess) {
                    if (state.cartItems.isEmpty) {
                      return const Expanded(child: EmptyCart());
                    }
                    return CartProductListView(cartlist: state.cartItems);
                  } else if (state is GetCartItemsError) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          state.errorMessage,
                          style: AppTextStyles.font14Bold,
                        ),
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
              ),

              // Order Summary
              BlocBuilder<CartCubit, CartState>(
                buildWhen:
                    (previous, current) =>
                        current is GetCartItemsSuccess ||
                        current is RemoveFromCartSuccess ||
                        current is ClearCartSuccess,
                builder: (context, state) {
                  if (state is GetCartItemsSuccess) {
                    return OrderSummary(subtotal: state.totalPrice);
                  }
                  // Default empty summary
                  return const OrderSummary(subtotal: 0.0);
                },
              ),

              // Checkout Button
              BlocBuilder<CartCubit, CartState>(
                buildWhen:
                    (previous, current) => current is GetCartItemsSuccess,
                builder: (context, state) {
                  final bool isCartEmpty =
                      state is GetCartItemsSuccess && state.cartItems.isEmpty;
                  return CheckoutButton(isEnabled: !isCartEmpty);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.assetsImagesBag, height: 100.h, width: 100.w),
        verticalSpace(26),
        const Text('Your cart is empty', style: AppTextStyles.font24Bold),
      ],
    );
  }
}
