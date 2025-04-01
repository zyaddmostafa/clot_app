import 'package:bloc/bloc.dart';
import 'package:clot_app/features/login/data/models/login_request_body.dart';
import 'package:clot_app/features/login/data/repos/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(LoginInitial());
  final LoginRepo _loginRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> loginWithEmailAndPassword() async {
    emit(LoginLoading());
    try {
      await _loginRepo.loginWithEmailAndPassword(
        loginRequestBody: LoginRequestBody(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(errorMessage: e.toString()));
    }
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    try {
      await _loginRepo.loginWithGoogle();
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(errorMessage: e.toString()));
    }
  }

  Future<void> loginWithFacebook() async {
    emit(LoginLoading());
    try {
      await _loginRepo.loginWithFacebook();
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(errorMessage: e.toString()));
    }
  }
}
