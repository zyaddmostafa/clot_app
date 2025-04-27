import 'package:clot_app/core/widgets/pop_button.dart';
import 'package:flutter/material.dart';

class ProductDetailsHeader extends StatelessWidget {
  const ProductDetailsHeader({super.key, this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const PopButton(),
        CircleAvatar(
          backgroundColor: Theme.of(context).cardColor,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_outline,
              color: Theme.of(context).primaryColor,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
}
