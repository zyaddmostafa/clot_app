import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/core/widgets/pop_button.dart';
import 'package:clot_app/features/cart/presentation/widgets/cart_product_item.dart';
import 'package:clot_app/features/cart/presentation/widgets/checkout_button.dart';
import 'package:clot_app/features/cart/presentation/widgets/order_summary.dart';
import 'package:flutter/material.dart';
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
                    // Handle remove all items action
                  },
                  child: const Text(
                    'Remove all items',
                    style: AppTextStyles.font16Bold,
                  ),
                ),
              ),
              verticalSpace(16),

              // Cart Items List
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder:
                      (context, index) => const Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: CartProductItem(),
                      ),
                ),
              ),

              // Order Summary
              const OrderSummary(),

              // Checkout Button
              const CheckoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
