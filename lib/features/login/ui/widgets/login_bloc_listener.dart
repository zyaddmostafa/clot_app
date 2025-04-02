import 'package:clot_app/core/routing/routes.dart';
import 'package:clot_app/core/themes/app_colors.dart';
import 'package:clot_app/core/utils/extentions.dart';
import 'package:clot_app/core/widgets/error_message.dart';
import 'package:clot_app/features/login/ui/cubits/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen:
          (previous, current) =>
              current is LoginLoading ||
              current is LoginSuccess ||
              current is LoginError,
      listener: (context, state) {
        switch (state.runtimeType) {
          case LoginLoading:
            showDialog(
              context: context,
              builder:
                  (context) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
            );
            break;
          case LoginSuccess:
            showSuccessDialog(context);
            break;
          case LoginError:
            final apiErrorModel = (state as LoginError).errorMessage;
            setupErrorState(context, ErrorMessage(message: apiErrorModel));
            break;
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Successful'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have logged in successfully!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                disabledForegroundColor: Colors.grey.withOpacity(0.38),
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.homeScreen,
                  (route) => false,
                );
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }

  void setupErrorState(BuildContext context, ErrorMessage errorMessage) {
    context.pop();
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            icon: const Icon(Icons.error, color: Colors.red, size: 32),
            content: Text(
              errorMessage.message,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text(
                  'Got it',
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
    );
  }
}
