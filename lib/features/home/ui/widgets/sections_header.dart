import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class SectionsHeader extends StatelessWidget {
  const SectionsHeader({super.key, required this.title, this.color});
  final String title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:
              color != null
                  ? AppTextStyles.font16Bold.copyWith(color: color)
                  : AppTextStyles.font16Bold,
        ),
        const Text('See All', style: AppTextStyles.font16Bold),
      ],
    );
  }
}
