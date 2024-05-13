import 'package:flutter/material.dart';
import 'package:mem/core/extension/context_extension.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/routing/routes_models.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/features/authentication/widgets/buttom_auth.dart';

class EmailVerficationScreen extends StatelessWidget {
  const EmailVerficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130.h,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "التحقق من البريد الالكتروني",
                  style: AppStyles.font30Black(context),
                ),
                SizedBox(
                  height: 50.h,
                ),
                TextFormField(
                  style: const TextStyle(color: AppPallete.black),
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: "ادخل رمز التحقيق",
                    hintStyle: AppStyles.font16LightGray(context),
                  ),
                  // controller: emailController,
                ),
                SizedBox(
                  height: 40.h,
                ),
                AuthtButtom(
                  buttomText:"تاكيد",
                  onPressed: () {
                    context.pushReplacementNamed(newPasswordScreen);
                    //  made if statment if not empty
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
    );
  }
}
