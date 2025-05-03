import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/widgets/pop_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutHeader extends StatelessWidget {
  const CheckoutHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const PopButton(),
        SizedBox(width: 100.w),
        const Text('Checkout', style: AppTextStyles.font16Bold),
      ],
    );
  }
}
