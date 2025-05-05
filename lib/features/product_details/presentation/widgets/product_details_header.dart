import 'dart:developer';

import 'package:clot_app/core/widgets/pop_button.dart';
import 'package:clot_app/features/home/data/model/product_response_model.dart';
import 'package:clot_app/features/wishlist/presentation/cubit/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsHeader extends StatelessWidget {
  const ProductDetailsHeader({super.key, required this.productModel});

  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const PopButton(),
        BlocBuilder<WishListCubit, WishListState>(
          builder: (context, state) {
            final wishlistCubit = context.read<WishListCubit>();
            final isInWishlist = wishlistCubit.isInWishlist(productModel);

            return CircleAvatar(
              backgroundColor: Theme.of(context).cardColor,
              child: IconButton(
                onPressed: () {
                  if (isInWishlist) {
                    wishlistCubit.removeFromWishlist(productModel);
                    log('Removed from wishlist: ${productModel.productId}');
                  } else {
                    wishlistCubit.addToWishlist(productModel);
                    log('Added to wishlist: ${productModel.productId}');
                  }
                },
                icon: Icon(
                  isInWishlist ? Icons.favorite : Icons.favorite_border,
                  color:
                      isInWishlist
                          ? Colors.red
                          : Theme.of(context).primaryColor,
                  size: 20,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
