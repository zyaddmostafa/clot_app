import 'package:clot_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: const CircleAvatar(
        backgroundColor: AppColors.secondaryColor,
        child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
      ),
    );
  }
}
