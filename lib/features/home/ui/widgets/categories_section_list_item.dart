import 'package:cached_network_image/cached_network_image.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/home/data/model/category_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesSectionListItem extends StatelessWidget {
  final CategoryItem categoryItem;
  final VoidCallback? onTap;

  const CategoriesSectionListItem({
    super.key,
    required this.categoryItem,
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
                child: CachedNetworkImage(
                  imageUrl: categoryItem.image,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) => Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                  errorWidget:
                      (context, url, error) => Icon(
                        Icons.error_outline,
                        color: Theme.of(context).colorScheme.error,
                      ),
                ),
              ),
            ),
            verticalSpace(8),
            Text(
              categoryItem.name,
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
