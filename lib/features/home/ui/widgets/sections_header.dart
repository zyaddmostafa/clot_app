import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class SectionsHeader extends StatelessWidget {
  const SectionsHeader({
    super.key,
    required this.title,
    this.color,
    this.onTap,
  });
  final String title;
  final Color? color;
  final void Function()? onTap;
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
        GestureDetector(
          onTap: onTap,
          child: const Text('See All', style: AppTextStyles.font16Bold),
        ),
      ],
    );
  }
}
