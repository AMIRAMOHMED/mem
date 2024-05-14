import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mem/core/extension/context_extension.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/networking/api_service.dart';
import 'package:mem/core/resources/validation.dart';
import 'package:mem/core/routing/routes_models.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/features/authentication/widgets/buttom_auth.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

final ApiService _apiService = GetIt.I<ApiService>();
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
  }

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  String emailFromUser = "";

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
                    "استعادة كلمة السر",
                    style: AppStyles.font40Black(context),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  TextFormField(
                    controller: emailController,
                    style: const TextStyle(color: AppPallete.black),
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: "البريد الالكتروني المستخدم",
                      hintStyle: AppStyles.font16LightGray(context),
                    ),
                    validator: MyValidators.emailValidator,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  AuthtButtom(
                    buttomText: "ارسل رمز التحقيق",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        _apiService.resetPassword(emailController.text);
                        setState(() {
                          emailFromUser = emailController.text;
                        });
                        context.pushReplacementNamed(emailVerficationScreen,arguments: emailFromUser);  
                      }
                    },
                    textStyle: AppStyles.font24White(context),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 150.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
