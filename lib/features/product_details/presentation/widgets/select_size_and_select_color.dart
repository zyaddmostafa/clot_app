import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/app_bottom_sheet.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/home/data/model/product_response_model.dart';
import 'package:clot_app/features/product_details/presentation/widgets/product_color.dart';
import 'package:clot_app/features/product_details/presentation/widgets/product_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectSizeAndSelectColor extends StatelessWidget {
  const SelectSizeAndSelectColor({
    super.key,
    required this.title,
    this.color,
    this.colorList,
    this.sizeModel,
  });
  final String title;
  final Color? color;
  final ColorList? colorList;
  final SizeModel? sizeModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (color != null) {
          AppBottomSheet.showAppBottomSheet(
            context,
            child: ProductColor(colorList: colorList!),
          );
        } else {
          AppBottomSheet.showAppBottomSheet(
            context,
            child: ProductSize(sizeModel: sizeModel),
          );
        }
      },
      child: Container(
        height: 56.h,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: ShapeDecoration(
          color: const Color(0xFF342F3F) /* Bg-Dark-2 */,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: AppTextStyles.font16Regular),
            Row(
              children: [
                if (color != null)
                  Container(
                    height: 24.h,
                    width: 24.w,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  )
                else
                  Text(
                    sizeModel?.sizes.first ?? colorList!.colors[0].name,
                    style: AppTextStyles.font16Bold,
                  ),
                horizontalSpace(22),

                Transform.rotate(
                  angle: -90 * 3.14 / 180,
                  child: const Icon(Icons.arrow_back_ios_outlined, size: 24),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductColorItem extends StatelessWidget {
  const ProductColorItem({super.key, required this.colorItem});
  final ColorItem colorItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: ShapeDecoration(
        color: AppColors.secondaryColorDarkMode,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(colorItem.name, style: AppTextStyles.font16Regular),

          const Icon(Icons.check, size: 24),
        ],
      ),
    );
  }
}
