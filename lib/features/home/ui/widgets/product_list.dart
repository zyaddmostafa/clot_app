import 'package:clot_app/features/home/data/model/product_response_model.dart';
import 'package:clot_app/features/home/ui/widgets/product_list_item.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.342,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ProductListItem(productModel: products[index]),
          );
        },
      ),
    );
  }
}
