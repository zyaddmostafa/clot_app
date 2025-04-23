import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/home/ui/widgets/shimmer_product_item.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCategoryProductGridView extends StatelessWidget {
  const ShimmerCategoryProductGridView({
    super.key,
    this.itemCount = 4,
    this.categoryName = '',
  });

  final int itemCount;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Shimmer for the category title and count
          Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 78, 78, 78),
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 100,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
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
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return const ShimmerProductItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
