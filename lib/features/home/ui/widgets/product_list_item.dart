import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({super.key});

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
          Container(
            width: double.infinity,
            height: 220.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://media.boohoo.com/i/boohoo/bmm24245_black_xl/male-black-basic-over-the-head-hoodie/?w=900&qlt=default&fmt.jp2.qlt=70&fmt=auto&sm=fit",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 120,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: AppColors.darkModeBackground,
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
                  const Text(
                    'Men\'s Jacket',
                    style: AppTextStyles.font12Medium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(4),
                  const Text('\$ 49.99', style: AppTextStyles.font12Bold),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
