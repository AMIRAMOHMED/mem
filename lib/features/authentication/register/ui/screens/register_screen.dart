import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/resources/validation.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/features/authentication/register/logic/cubit/register_cubit.dart';

import 'package:mem/features/authentication/register/ui/widgets/register_blco_listner.dart';
import 'package:mem/features/authentication/register/ui/widgets/user_selection_box.dart';
import 'package:mem/features/authentication/widgets/buttom_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/themes/app_pallete.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

late TextEditingController emailController;
late TextEditingController firstNameController;
late TextEditingController lastNameController;
late TextEditingController passwordController;

TextEditingController confirmPasswordController = TextEditingController();
String selectedUserOption = '';

class _RegisterScreenState extends State<RegisterScreen> {
  bool isShowPassword = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    emailController = context.read<RegisterCubit>().emailController;
    firstNameController = context.read<RegisterCubit>().firstNameController;
    lastNameController = context.read<RegisterCubit>().lastNameController;
    passwordController = context.read<RegisterCubit>().passwordController;
  }

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(height: 50.h),
                Text(
                  "تسجيل حساب جديد",
                  textAlign: TextAlign.center,
                  style: AppStyles.font40Black(context),
                ),
                SizedBox(height: 10.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 165.w,
                      child: TextFormField(
                        style: const TextStyle(color: AppPallete.black),
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: "اسم العائلة",
                          hintStyle: AppStyles.font16LightGray(context),
                        ),
                        controller: lastNameController,
                        validator: (value) {
                          return MyValidators.displayNamevalidator(value);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 165.w,
                      child: TextFormField(
                        style: const TextStyle(color: AppPallete.black),
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: "الاسم الاول",
                          hintStyle: AppStyles.font16LightGray(context),
                        ),
                        controller: firstNameController,
                        validator: (value) {
                          return MyValidators.displayNamevalidator(value);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  style: const TextStyle(color: AppPallete.black),
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: 'البريد الالكتروني',
                    hintStyle: AppStyles.font16LightGray(context),
                  ),
                  controller: emailController,
                  validator: (value) {
                    return MyValidators.emailValidator(value);
                  },
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  style: const TextStyle(color: AppPallete.black),
                  textAlign: TextAlign.right,
                  obscureText: isShowPassword,
                  decoration: InputDecoration(
                    hintStyle: AppStyles.font16LightGray(context),
                    hintText: 'كلمة السر ',
                    prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        },
                        icon: Icon(
                          isShowPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppPallete.lightGray,
                        )),
                  ),
                  controller: passwordController,
                  validator: (value) {
                    return MyValidators.passwordValidator(value);
                  },
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  style: const TextStyle(color: AppPallete.black),
                  textAlign: TextAlign.right,
                  obscureText: isShowPassword,
                  decoration: InputDecoration(
                    hintStyle: AppStyles.font16LightGray(context),
                    hintText: 'تأكيد كلمة السر ',
                    prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        },
                        icon: Icon(
                          isShowPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppPallete.lightGray,
                        )),
                  ),
                  controller: confirmPasswordController,
                  validator: (value) {
                    return MyValidators.repeatPasswordValidator(
                        value: value, password: passwordController.text);
                  },
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "هل انت؟",
                    style: AppStyles.font16LightGray(context),
                  ),
                ),
                SizedBox(
                  width: 340.w,
                  child: UserSelectionBox(
                    onSelectionChanged: (selectedOption) {
                      selectedUserOption = selectedOption;
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                AuthtButtom(
                  buttomText: 'تسجيل',
                  textStyle: AppStyles.font24White(context),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context
                          .read<RegisterCubit>()
                          .emitRegisterState(selectedUserOption);
                    }
                  },
                ),
                const RegisterBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
