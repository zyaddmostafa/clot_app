import 'package:clot_app/core/utils/spacing.dart';
import 'package:clot_app/core/widgets/app_button.dart';
import 'package:clot_app/features/signup/ui/cubits/signup/sign_up_cubit.dart';
import 'package:clot_app/features/signup/ui/widgets/sign_up_bloc_listener.dart';
import 'package:clot_app/features/signup/ui/widgets/sign_up_form.dart';
import 'package:clot_app/features/signup/ui/widgets/sign_up_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                const SignUpHeader(),
                verticalSpace(20),
                const Text(
                  'Create account',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                verticalSpace(32),
                const SignUpForm(),
                verticalSpace(40),
                AppButton(
                  text: 'Continue',
                  onPressed: () {
                    validateThenDoSignUp(context);
                  },
                ),
                const SignupBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void validateThenDoSignUp(BuildContext context) {
  final cubit = context.read<SignUpCubit>();
  if (cubit.formKey.currentState!.validate()) {
    cubit.signUpWithEmailAndPassword();
  }
}
