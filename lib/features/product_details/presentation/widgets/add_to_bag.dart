import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class AddToBag extends StatelessWidget {
  const AddToBag({super.key, required this.productPrice});
  final String productPrice;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: ShapeDecoration(
          color: AppColors.primaryColor /* Primary-100 */,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$$productPrice', style: AppTextStyles.font16Bold),
            const Text('Add to Bag', style: AppTextStyles.font16Regular),
          ],
        ),
      ),
    );
  }
}
