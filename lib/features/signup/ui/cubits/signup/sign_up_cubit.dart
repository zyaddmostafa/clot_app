import 'package:bloc/bloc.dart';
import 'package:clot_app/core/widgets/error_message.dart';
import 'package:clot_app/features/signup/data/models/sign_up_request_body.dart';
import 'package:clot_app/features/signup/data/repos/sign_up_repo.dart';
import 'package:flutter/widgets.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());

  final SignUpRepo signUpRepo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void signUpWithEmailAndPassword() async {
    emit(SignUpLoading());
    try {
      await signUpRepo.signUpWithEmailAndPassword(
        signUpRequestBody: SignUpRequestBody(
          email: emailController.text,
          password: passwordController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
        ),
      );

      emit(SignUpSuccess());
      emailController.clear();
      passwordController.clear();
      firstNameController.clear();
      lastNameController.clear();
    } catch (e) {
      emit(SignUpError(errorMessage: ErrorMessage(message: e.toString())));
      emailController.clear();
      passwordController.clear();
      firstNameController.clear();
      lastNameController.clear();
    }
  }
}
