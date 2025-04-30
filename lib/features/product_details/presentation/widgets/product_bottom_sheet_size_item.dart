import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductBottomSheetSizeItem extends StatelessWidget {
  const ProductBottomSheetSizeItem({
    super.key,
    required this.size,
    required this.isSelected,
  });
  final String size;
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(size, style: AppTextStyles.font16Regular),

          isSelected
              ? const Icon(Icons.check, size: 24)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
