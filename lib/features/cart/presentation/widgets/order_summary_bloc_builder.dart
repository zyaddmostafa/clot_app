import 'package:clot_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:clot_app/features/cart/presentation/widgets/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSummaryBlocBuilder extends StatelessWidget {
  const OrderSummaryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
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
    );
  }
}
