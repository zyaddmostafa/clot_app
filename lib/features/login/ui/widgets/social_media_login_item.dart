import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';

class SocialMediaLoginItem extends StatelessWidget {
  const SocialMediaLoginItem({
    super.key,
    required this.imageName,
    required this.text,
    required this.onTap,
  });
  final String imageName;
  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 18),
        decoration: ShapeDecoration(
          color: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
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
      ),
    );
  }
}
