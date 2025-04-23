import 'package:cached_network_image/cached_network_image.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/features/home/data/model/category_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopByCategoriesItem extends StatelessWidget {
  const ShopByCategoriesItem({
    super.key,
    required this.categoryItem,
    required this.onTap,
  });
  final CategoryItem categoryItem;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: ShapeDecoration(
          color: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: ClipRRect(
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
            ),

            Text(categoryItem.name, style: AppTextStyles.font16Regular),
          ],
        ),
      ),
    );
  }
}
