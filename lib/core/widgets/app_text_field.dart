import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.controller,
    this.prefixIconColor,
  });
  final String hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final bool obscureText = false;
  final Color? prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $hintText';
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Theme.of(context).cardColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Theme.of(context).cardColor),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),

        hintText: hintText,
        hintStyle: AppTextStyles.font16Regular,
        filled: true,
        fillColor: Theme.of(context).cardColor,

        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
      ),

      obscureText: obscureText,
    );
  }
}
