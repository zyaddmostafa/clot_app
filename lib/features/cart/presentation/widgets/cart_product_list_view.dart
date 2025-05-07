import 'package:clot_app/features/cart/data/model/cart_product_response_model.dart';
import 'package:clot_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:clot_app/features/cart/presentation/widgets/cart_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductListView extends StatelessWidget {
  const CartProductListView({super.key, required this.cartlist});
  final List<CartProductResponseModel> cartlist;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: cartlist.length,
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: CartProductItem(
                cartProductModel: cartlist[index],
                onRemove: () {
                  // Call remove from cart in the Cubit
                  context.read<CartCubit>().removeFromCart(
                    cartlist[index].productId,
                  );
                },
              ),
            ),
      ),
    );
  }
}
