import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/extentions.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/features/home/data/model/product_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSize extends StatelessWidget {
  const ProductSize({super.key, this.sizeModel});
  final SizeModel? sizeModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,

      height: MediaQuery.of(context).size.height * 0.5,
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(
        color: const Color(0xFF1D182A) /* Bg-Dark-1 */,
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
              spacing: 108,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Size', style: AppTextStyles.font24Bold),

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
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ProductSizeItem(size: sizeModel!.sizes[index]),
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

class ProductSizeItem extends StatelessWidget {
  const ProductSizeItem({super.key, required this.size});
  final String size;
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
          Text(size, style: AppTextStyles.font16Regular),

          const Icon(Icons.check, size: 24),
        ],
      ),
    );
  }
}
