import 'package:clot_app/core/models/product_response_model.dart';
import 'package:clot_app/core/widgets/custom_product_grid_view.dart';
import 'package:flutter/material.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomProductGridView(products: products),
    );
  }
}
