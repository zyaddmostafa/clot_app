import 'package:clot_app/features/cart/data/model/cart_product_response_model.dart';
import 'package:clot_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:clot_app/features/cart/presentation/widgets/checkout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutButtonBlocBuilder extends StatelessWidget {
  const CheckoutButtonBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) => current is GetCartItemsSuccess,

      builder: (context, state) {
        final bool isCartEmpty =
            state is GetCartItemsSuccess && state.cartItems.isEmpty;
        List<CartProductResponseModel> cartItems =
            state is GetCartItemsSuccess ? state.cartItems : const [];

        return CheckoutButton(isEnabled: !isCartEmpty, cartItems: cartItems);
      },
    );
  }
}
