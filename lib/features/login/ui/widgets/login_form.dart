import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/core/widgets/app_text_field.dart';
import 'package:clot_app/features/login/ui/cubits/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextField(
            hintText: 'Email Address',
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(16),
          AppTextField(
            hintText: 'Password',
            controller: context.read<LoginCubit>().passwordController,
          ),
        ],
      ),
    );
  }
}
