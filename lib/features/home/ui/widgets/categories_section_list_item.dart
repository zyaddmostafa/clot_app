import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/assets_images.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesSectionListItem extends StatelessWidget {
  final String? imagePath;
  final String categoryName;
  final VoidCallback? onTap;

  const CategoriesSectionListItem({
    super.key,
    this.imagePath,
    required this.categoryName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                height: 56.h,
                width: 56.w,
                decoration: BoxDecoration(color: Theme.of(context).cardColor),
                child: Image.asset(
                  imagePath ?? Assets.assetsImagesTestImage2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            verticalSpace(8),
            Text(
              categoryName,
              style: AppTextStyles.font14Regular,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
