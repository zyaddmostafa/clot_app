import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/home/ui/widgets/product_list.dart';
import 'package:clot_app/features/home/ui/widgets/sections_header.dart';
import 'package:flutter/material.dart';

class NewInSection extends StatelessWidget {
  const NewInSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionsHeader(title: 'New In', color: AppColors.primaryColor),
        verticalSpace(17),
        const ProductList(),
      ],
    );
  }
}
