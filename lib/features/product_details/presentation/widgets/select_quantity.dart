import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectQuantity extends StatelessWidget {
  const SelectQuantity({
    super.key,
    required this.title,
    required this.onIncrement,
    required this.onDecrement,
    this.quantityNumber = 1,
  });
  final String title;
  final void Function()? onIncrement;
  final void Function()? onDecrement;
  final int quantityNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: ShapeDecoration(
        color: const Color(0xFF342F3F) /* Bg-Dark-2 */,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.font16Regular),
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.primaryColor,
                child: Center(
                  child: IconButton(
                    onPressed: onDecrement,
                    icon: const Icon(Icons.remove, size: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  '$quantityNumber',
                  style: AppTextStyles.font16Regular,
                ),
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.primaryColor,
                child: Center(
                  child: IconButton(
                    onPressed: onIncrement,
                    icon: const Icon(Icons.add, size: 16),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
