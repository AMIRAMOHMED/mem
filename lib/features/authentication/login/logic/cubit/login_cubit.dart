import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mem/core/service/shared_pref/pref_keys.dart';
import 'package:mem/core/service/shared_pref/shared_pref.dart';
import 'package:mem/features/authentication/login/logic/cubit/login_state.dart';
import 'package:mem/features/authentication/login/data/models/login_request_body.dart';
import 'package:mem/features/authentication/login/data/repository/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
          emailOrUsername: emailController.text,
          password: passwordController.text),
    );

    response.when(
      success: (loginResponse) async {
        final userData = loginResponse;
        {
          await SharedPref()
              .setString(PrefKeys.accessToken, userData.token ?? '');
          await SharedPref()
              .setString(PrefKeys.displayName, userData.firstName ?? '');
          await SharedPref().setString(
              PrefKeys.profilePictureUrl, userData.profilePictureUrl ?? '');
          await SharedPref().setString(PrefKeys.type, userData.type ?? '');
          await SharedPref().setBoolean(PrefKeys.isLogin, true);
        }

        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(
          LoginState.error(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}
