import 'package:clot_app/core/models/product_response_model.dart';
import 'package:clot_app/features/home/ui/widgets/product_list_item.dart';
import 'package:flutter/material.dart';

class CustomProductGridView extends StatelessWidget {
  const CustomProductGridView({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.57,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductListItem(productModel: products[index]);
      },
    );
  }
}
