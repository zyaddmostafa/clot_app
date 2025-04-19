import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/home/ui/widgets/product_list.dart';
import 'package:clot_app/features/home/ui/widgets/sections_header.dart';
import 'package:flutter/material.dart';

class TopSellingSection extends StatelessWidget {
  const TopSellingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionsHeader(title: 'Top Selling'),
        verticalSpace(17),
        const ProductList(),
      ],
    );
  }
}
