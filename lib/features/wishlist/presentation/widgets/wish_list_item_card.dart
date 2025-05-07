import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';

class WishlistItemCard extends StatelessWidget {
  final VoidCallback onRemove;
  final VoidCallback? onPressed;

  const WishlistItemCard({super.key, required this.onRemove, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Product Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.network(
                'https://example.com/image.jpg', // Replace with actual image URL
                width: 100.w,
                height: 100.w,
                fit: BoxFit.cover,
                errorBuilder:
                    (_, __, ___) => Container(
                      width: 100.w,
                      height: 100.w,
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.image_not_supported,
                        size: 40,
                        color: Colors.grey[600],
                      ),
                    ),
              ),
            ),

            // Product Details
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Name', // Replace with actual product name
                      style: AppTextStyles.font16Bold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '\$${99.99}', // Replace with actual product price
                      style: AppTextStyles.font16Bold.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Remove button
            IconButton(
              onPressed: onRemove,
              icon: const Icon(Icons.favorite, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
