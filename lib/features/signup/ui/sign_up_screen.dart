import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/core/widgets/app_button.dart';
import 'package:clot_app/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const CircleAvatar(
                    backgroundColor: AppColors.secondaryColor,
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                verticalSpace(20),
                const Text(
                  'Create account',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                verticalSpace(32),
                const AppTextField(hintText: 'First Name'),
                verticalSpace(16),
                const AppTextField(hintText: 'Last Name'),
                verticalSpace(16),
                const AppTextField(hintText: 'Email Address'),
                verticalSpace(16),
                const AppTextField(hintText: 'Password'),
                verticalSpace(40),
                const AppButton(text: 'Continue'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
