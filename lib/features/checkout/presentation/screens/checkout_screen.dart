import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/cart_helper.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/core/widgets/app_text_field.dart';
import 'package:clot_app/core/widgets/pop_button.dart';
import 'package:clot_app/features/cart/data/model/cart_product_response_model.dart';
import 'package:clot_app/features/cart/presentation/widgets/order_summary.dart';
import 'package:clot_app/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:clot_app/features/checkout/presentation/widgets/palce_order_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key, required this.cartItems});
  final List<CartProductResponseModel> cartItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              // Header - Fixed outside the scroll
              Row(
                children: [
                  const PopButton(),
                  SizedBox(width: 100.w),
                  const Text('Checkout', style: AppTextStyles.font16Bold),
                ],
              ),
              verticalSpace(16),

              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(16),
                      const Text(
                        'Shipping Address',
                        style: AppTextStyles.font14Bold,
                      ),
                      verticalSpace(8),
                      Form(
                        key: context.read<CheckoutCubit>().formKey,
                        child: AppTextField(
                          hintText: 'Enter your full address',
                          maxLines: 3,

                          controller:
                              context.read<CheckoutCubit>().addressController,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Fixed bottom section
              verticalSpace(16),
              OrderSummary(
                subtotal: CartHelper.calculateSubTotalPrice(cartItems),
              ),
              verticalSpace(16),
              PalceOrderButton(cartItems: cartItems),
            ],
          ),
        ),
      ),
    );
  }
}
