import 'package:clot_app/core/paymob/paymob_gateway.dart';
import 'package:clot_app/core/utils/cart_helper.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/cart/data/model/cart_product_response_model.dart';
import 'package:clot_app/features/cart/presentation/widgets/order_summary.dart';
import 'package:clot_app/features/checkout/presentation/widgets/checkout_address_applying.dart';
import 'package:clot_app/features/checkout/presentation/widgets/checkout_header.dart';
import 'package:clot_app/features/checkout/presentation/widgets/place_order_button.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.cartItems});
  final List<CartProductResponseModel> cartItems;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  void initState() {
    PaymobGateway.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              // Header - Fixed outside the scroll
              const CheckoutHeader(),
              verticalSpace(16),

              // Scrollable content
              const CheckoutAddressApplying(),

              // Fixed bottom section
              verticalSpace(16),
              OrderSummary(
                subtotal: CartHelper.calculateSubTotalPrice(widget.cartItems),
                total: CartHelper.calculateTotalPrice(widget.cartItems),
              ),
              verticalSpace(16),
              PlaceOrderButton(cartItems: widget.cartItems),
            ],
          ),
        ),
      ),
    );
  }
}
