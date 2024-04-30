import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mem/features/authentication/register/logic/cubit/register_state.dart';
import 'package:mem/features/authentication/register/models/register_requset_body.dart';
import 'package:mem/features/authentication/register/repository/register_repo.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterReop _registerRepo;

  RegisterCubit(this._registerRepo) : super(const RegisterState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  XFile pickImage = XFile("");
void updatePickImage(XFile image) {
  pickImage = image;
}
  void emitRegisterState(String selectedUserOption) async {
    FormData picFormData;
  
    picFormData = FormData.fromMap({
      "profilePictureUrl:": await MultipartFile.fromFile(pickImage.path,
          filename: "profile.jpg"),
    });
    log(picFormData.toString());
    emit(const RegisterState.loading());

    final response = await _registerRepo.register(
      RegisterRequestBody(
        email: emailController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        password: passwordController.text,
        type: selectedUserOption,
        username: "${firstNameController.text}${lastNameController.text}",
        profilePictureUrl: picFormData.toString(),
      ),
    );

    response.when(
      success: (registerResponse) {
        emit(RegisterState.success(registerResponse));
      },
      failure: (error) {
        emit(RegisterState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
