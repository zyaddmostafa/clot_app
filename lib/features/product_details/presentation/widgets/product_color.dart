import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/extentions.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/home/data/model/product_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductColor extends StatelessWidget {
  const ProductColor({super.key, required this.colorList});
  final ColorList colorList;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,

      height: MediaQuery.of(context).size.height * 0.5,
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(
        color: Color(0xFF1D182A) /* Bg-Dark-1 */,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Color', style: AppTextStyles.font24Bold),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.close, size: 24),
                ),
              ],
            ),
            verticalSpace(20),
            Expanded(
              child: ListView.builder(
                itemCount: colorList.colors.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ProductColorItem(colorItem: colorList.colors[index]),
                  );
                },
              ),
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
          const Icon(Icons.check, size: 24),
        ],
      ),
    );
  }
}
