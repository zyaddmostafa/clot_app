import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/core/widgets/pop_button.dart';
import 'package:clot_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:clot_app/features/cart/presentation/widgets/cart_product_bloc_consumer.dart';
import 'package:clot_app/features/cart/presentation/widgets/checkout_button_bloc_builder.dart';
import 'package:clot_app/features/cart/presentation/widgets/order_summary_bloc_builder.dart';
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
                spacing: 110.w,
                children: const [
                  PopButton(),

                  Text('Cart', style: AppTextStyles.font16Bold),
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
              const CartProductBlocConsumer(),

              // Order Summary
              const OrderSummaryBlocBuilder(),

              // Checkout Button
              const CheckoutButtonBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
