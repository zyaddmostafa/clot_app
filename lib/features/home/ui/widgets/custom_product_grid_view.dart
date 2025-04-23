import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/home/data/model/product_response_model.dart';
import 'package:clot_app/features/home/ui/widgets/product_list_item.dart';
import 'package:flutter/material.dart';

class CustomProductGridViewSection extends StatelessWidget {
  const CustomProductGridViewSection({
    super.key,
    required this.products,
    required this.categoryName,
  });
  final List<ProductModel> products;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$categoryName (${products.length})',
            style: AppTextStyles.font16Bold,
          ),
          verticalSpace(24),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.58,
              ),
              itemCount: products.length, // Replace with your actual item count
              itemBuilder: (context, index) {
                return ProductListItem(productModel: products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
