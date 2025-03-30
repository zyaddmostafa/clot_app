import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/core/widgets/app_text_field.dart';
import 'package:clot_app/features/signup/ui/cubits/signup/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          const AppTextField(hintText: 'First Name'),
          verticalSpace(16),
          const AppTextField(hintText: 'Last Name'),
          verticalSpace(16),
          AppTextField(
            hintText: 'Email Address',
            controller: context.read<SignUpCubit>().emailController,
          ),
          verticalSpace(16),
          AppTextField(
            hintText: 'Password',
            controller: context.read<SignUpCubit>().passwordController,
          ),
        ],
      ),
    );
  }
}
