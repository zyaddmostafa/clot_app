import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/core/models/product_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductBottomSheetColorItem extends StatelessWidget {
  const ProductBottomSheetColorItem({
    super.key,
    required this.colorItem,
    required this.isSelected,
  });
  final ColorItem colorItem;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: ShapeDecoration(
        color:
            isSelected
                ? AppColors.primaryColor
                : AppColors.secondaryColorDarkMode,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: Row(
        children: [
          Text(colorItem.name, style: AppTextStyles.font16Regular),
          const Spacer(flex: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: 24.h,
            width: 24.w,
            decoration: BoxDecoration(
              color: Color(int.parse(colorItem.hex)),
              shape: BoxShape.circle,
            ),
          ),
          const Spacer(flex: 1),
          isSelected ? const Icon(Icons.check, size: 24) : horizontalSpace(24),
        ],
      ),
    );
  }
}
