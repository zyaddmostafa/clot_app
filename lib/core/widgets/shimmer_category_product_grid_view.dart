import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/home/ui/widgets/shimmer_product_item.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProductGridView extends StatelessWidget {
  const ShimmerProductGridView({
    super.key,
    this.itemCount = 4,
    this.categoryName,
  });

  final int itemCount;
  final String? categoryName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Only show the category title shimmer if categoryName is provided
          if (categoryName != null)
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

          // Only add spacing if we're showing the category name
          if (categoryName != null) verticalSpace(24),

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
