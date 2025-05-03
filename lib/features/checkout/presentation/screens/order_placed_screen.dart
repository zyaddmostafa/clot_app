import 'package:clot_app/core/routing/routes.dart';
import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/assets_images.dart';
import 'package:clot_app/core/utils/extentions.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.7,
        child: Image.asset(
          Assets.assetsImagesOrderPlaced,
          height: 252.h,
          width: 316.w,
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.4,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Theme.of(context).cardColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Order Placed Successfully',
              style: AppTextStyles.font32Bold,
            ),

            verticalSpace(72),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 100,
                  vertical: 16,
                ),
              ),
              onPressed: () {
                context.pushReplacementNamed(Routes.mainLayout);
              },
              child: const Text(
                'Back to Home',
                style: AppTextStyles.font16Bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
