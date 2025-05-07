import 'package:clot_app/core/routing/routes.dart';
import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/extentions.dart';
import 'package:clot_app/features/cart/data/model/cart_product_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key, required this.isEnabled, this.cartItems});
  final bool isEnabled;
  final List<CartProductResponseModel>? cartItems;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: () {
          if (isEnabled) {
            // Navigate to checkout screen
            context.pushNamed(Routes.checkoutScreen, arguments: cartItems);
          } else {
            // Show a message or do nothing
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Your cart is empty!')),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).primaryColor,
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: const Text(' Checkout', style: AppTextStyles.font16Regular),
      ),
    );
  }
}
