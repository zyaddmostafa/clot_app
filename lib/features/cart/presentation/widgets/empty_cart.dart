import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/assets_images.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.assetsImagesBag, height: 100.h, width: 100.w),
        verticalSpace(26),
        const Text('Your cart is empty', style: AppTextStyles.font24Bold),
      ],
    );
  }
}
