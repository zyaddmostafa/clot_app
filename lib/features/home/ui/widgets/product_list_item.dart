import 'package:cached_network_image/cached_network_image.dart';
import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/home/data/model/product_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 159.w,
      height: 282.h,
      padding: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: AppColors.secondaryColorDarkMode,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Stack(
        children: [
          // Replaced NetworkImage with CachedNetworkImage
          CachedNetworkImage(
            width: double.infinity,
            height: 220.h,
            imageUrl:
                productModel.image ??
                'https://via.placeholder.com/150', // Use the actual image URL from your model
            imageBuilder:
                (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            placeholder:
                (context, url) => Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.darkModeBackground,
                    ),
                  ),
                ),
            errorWidget:
                (context, url, error) => Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(
                      Icons.error_outline,
                      color: AppColors.darkModeBackground,
                    ),
                  ),
                ),
          ),
          Positioned(
            left: 120,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: Theme.of(context).primaryColor,
                size: 20.sp,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 220.h,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(7),
                  Text(
                    productModel.title ??
                        'No Title', // Use actual product name from model
                    style: AppTextStyles.font12Medium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(4),
                  Text(
                    '\$${productModel.price}', // Use actual product price from model
                    style: AppTextStyles.font12Bold,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
