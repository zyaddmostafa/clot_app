import 'package:clot_app/core/themes/app_text_styles.dart';
import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/core/widgets/app_button.dart';
import 'package:clot_app/features/login/ui/cubits/login_cubit/login_cubit.dart';
import 'package:clot_app/features/login/ui/widgets/dont_have_an_account.dart';
import 'package:clot_app/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:clot_app/features/login/ui/widgets/login_form.dart';
import 'package:clot_app/features/login/ui/widgets/social_media_login_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(80),
                const Text('Sign in', style: AppTextStyles.font32Bold),
                verticalSpace(32),
                const LoginForm(),
                verticalSpace(16),
                AppButton(
                  text: 'Continue',
                  onPressed: () {
                    validateThenLogin(context);
                  },
                ),
                verticalSpace(16),
                const DontHaveAnAccount(),
                verticalSpace(70),
                const SocialMediaLoginList(),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    if (cubit.formKey.currentState!.validate()) {
      cubit.loginWithEmailAndPassword();
    }
  }
}
