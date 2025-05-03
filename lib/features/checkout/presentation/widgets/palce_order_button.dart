import 'dart:developer';
import 'package:clot_app/core/routing/routes.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/cart_helper.dart';
import 'package:clot_app/core/utils/extentions.dart';
import 'package:clot_app/features/cart/data/model/cart_product_response_model.dart';
import 'package:clot_app/features/checkout/data/models/checkout_request_model.dart';
import 'package:clot_app/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_with_paymob/pay_with_paymob.dart';

class PalceOrderButton extends StatelessWidget {
  const PalceOrderButton({super.key, required this.cartItems});
  final List<CartProductResponseModel> cartItems;
  @override
  Widget build(BuildContext context) {
    bool isLoading =
        context.watch<CheckoutCubit>().state is CheckoutAddOrderLoading;
    return GestureDetector(
      onTap: () {
        // Validate the form before proceeding
        addOrderValidation(context, cartItems);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: ShapeDecoration(
          color: const Color(0xFF8E6CEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child:
              isLoading
                  ? const Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    ),
                  )
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${CartHelper.calculateSubTotalPrice(cartItems)}',
                        style: AppTextStyles.font16Bold,
                      ),
                      const Text(
                        'Place Order',
                        style: AppTextStyles.font16Bold,
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}

void addOrderValidation(
  BuildContext context,
  List<CartProductResponseModel> cartItems,
) {
  final cubit = context.read<CheckoutCubit>();
  if (cubit.formKey.currentState!.validate()) {
    cubit.formKey.currentState!.save();
    // addOrder(cubit, cartItems);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => PaymentView(
              onPaymentSuccess: () {
                // Handle payment success
                log('Payment successful!');
                addOrder(cubit, cartItems);
                Future.delayed(const Duration(seconds: 3), () {
                  context.pushReplacementNamed(Routes.orderPlaced);
                });
              },
              onPaymentError: () {
                Future.delayed(const Duration(seconds: 3), () {
                  context.pushReplacementNamed(Routes.mainLayout);
                });
                log('Payment failed!');
                // Handle payment failure
              },
              price: CartHelper.calculateSubTotalPrice(
                cartItems,
              ), // Required: Total price (e.g., 100 for 100 EGP)
            ),
      ),
    );
  }
}

void addOrder(CheckoutCubit cubit, List<CartProductResponseModel> cartItems) {
  final address = cubit.addressController.text;
  const paymentMethod = 'Paid Online'; // Example payment method
  final createdDate = DateTime.now().toString();
  final totalPrice = CartHelper.calculateSubTotalPrice(cartItems);

  // Create the checkout request model
  final checkoutRequestModel = CheckoutRequestModel(
    orderItems: cartItems,
    address: address,
    paymentMethod: paymentMethod,
    createdDate: createdDate,
    subTotalPrice: totalPrice,
  );

  // Call the addOrder method in the CheckoutCubit
  cubit.addOrder(checkoutRequestModel);
}
