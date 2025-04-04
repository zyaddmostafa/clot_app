import 'package:clot_app/core/routing/routes.dart';
import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.signUpScreen),
      child: Text.rich(
        TextSpan(
          children: [
            const TextSpan(
              text: 'Dont have an Account ? ',
              style: AppTextStyles.font14Regular,
            ),
            TextSpan(
              text: 'Create One',
              style: AppTextStyles.font14Bold.copyWith(),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
