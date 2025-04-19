import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class CategoriesSectionHeader extends StatelessWidget {
  const CategoriesSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Categories', style: AppTextStyles.font16Bold),
        Text('See All', style: AppTextStyles.font16Bold),
      ],
    );
  }
}
