import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreenOptionItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const ProfileScreenOptionItem({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56.h,
        padding: const EdgeInsets.all(16),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFF342F3F) /* Bg-Dark-2 */,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: AppTextStyles.font16Bold),

            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Theme.of(context).primaryColor,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
