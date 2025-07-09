import 'package:clot_app/core/widgets/shimmer_category_product_grid_view.dart';
import 'package:flutter/material.dart';

class SearchResultShimmerWidget extends StatelessWidget {
  const SearchResultShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: ShimmerProductGridView(),
    );
  }
}
