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

class NewPasswordScreen extends StatefulWidget {
  final String email, code;
  const NewPasswordScreen({
    super.key,
    required this.email,
    required this.code,
  });

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();
final ApiService _apiService = GetIt.I<ApiService>();

@override
void dispose() {
  passwordController.dispose();
  confirmPasswordController.dispose();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  bool isShowPassword = true;

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
                    "كلمة سر جديدة",
                    style: AppStyles.font40Black(context),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  TextFormField(
                    style: const TextStyle(color: AppPallete.black),
                    textAlign: TextAlign.right,
                    obscureText: isShowPassword,
                    controller: passwordController,
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
                    validator: MyValidators.passwordValidator,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextFormField(
                    style: const TextStyle(color: AppPallete.black),
                    textAlign: TextAlign.right,
                    obscureText: isShowPassword,
                    controller: confirmPasswordController,
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
                    validator: (value) {
                      return MyValidators.repeatPasswordValidator(
                          value: value, password: passwordController.text);
                    },
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  AuthtButtom(
                    buttomText: " تغيير",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        _apiService
                            .confirmResetPassword(widget.email, widget.code,
                                passwordController.text)
                            .then((value) {
                          print(value);
                          context.pushReplacementNamed(splashScreen);
                        }).catchError((e) {
                          print(e);
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                "خطأ في البيانات المدخلة",
                                style: AppStyles.font20Black(context),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        });
                      }
                    },
                    textStyle: AppStyles.font24White(context),
                  ),
                  SizedBox(
                    height: 20.h,
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
