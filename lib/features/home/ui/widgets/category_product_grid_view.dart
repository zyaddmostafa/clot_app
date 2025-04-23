import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/home/data/model/product_response_model.dart';
import 'package:clot_app/features/home/ui/widgets/custom_product_grid_view.dart';
import 'package:flutter/material.dart';

class CategoryProductGridViewSection extends StatelessWidget {
  const CategoryProductGridViewSection({
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
          CustomProductGridView(products: products),
        ],
      ),
    );
  }
}
