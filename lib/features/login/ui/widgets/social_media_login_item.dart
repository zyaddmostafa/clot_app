import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';

class SocialMediaLoginItem extends StatelessWidget {
  const SocialMediaLoginItem({
    super.key,
    required this.imageName,
    required this.text,
  });
  final String imageName;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 18),
      decoration: ShapeDecoration(
        color: AppColors.secondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: Row(
        children: [
          Image.asset(imageName, fit: BoxFit.cover),
          horizontalSpace(53),
          Text(
            text,
            textAlign: TextAlign.center,
            style: AppTextStyles.font16Medium,
          ),
        ],
      ),
    );
  }
}
