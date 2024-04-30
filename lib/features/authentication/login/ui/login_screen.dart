import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem/core/extension/context_extension.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/resources/validation.dart';
import 'package:mem/core/routing/routes_models.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/features/authentication/login/logic/cubit/login_cubit.dart';
import 'package:mem/features/authentication/login/ui/login_bloc_listner.dart';
import 'package:mem/features/authentication/widgets/buttom_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

late TextEditingController passwordController;

late TextEditingController emailController;

class _LoginScreenState extends State<LoginScreen> {
  bool isShowPassword = true;
  @override
  void initState() {
    super.initState();
    emailController = context.read<LoginCubit>().emailController;
    passwordController = context.read<LoginCubit>().passwordController;
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 130.h,
                  ),
                  Text(
                    "مرحبا بك",
                    style: AppStyles.font40Black(context),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  TextFormField(
                    style: const TextStyle(color: AppPallete.black),
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: 'البريد الالكتروني',
                      hintStyle: AppStyles.font16LightGray(context),
                    ),
                    controller: emailController,
                    validator: MyValidators.emailValidator,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
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
                        ),
                      ),
                    ),
                    controller: passwordController,
                    validator: MyValidators.passwordValidator,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "نسيت كلمة السر؟",
                      style: AppStyles.font16Blue(context),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  AuthtButtom(
                    buttomText: 'تسجيل الدخول',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<LoginCubit>().emitLoginStates();
                      }
                    },
                    textStyle: AppStyles.font24White(context),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  AuthtButtom(
                    buttomText: 'تسجيل حساب جديد',
                    color: AppPallete.white,
                    onPressed: () {
                      context.pushReplacementNamed(registerScreen);
                    },
                    textStyle: AppStyles.font24Blue(context),
                  ),
                  SizedBox(
                    height: 150.h,
                  ),
                  const LoginBlocListener()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
