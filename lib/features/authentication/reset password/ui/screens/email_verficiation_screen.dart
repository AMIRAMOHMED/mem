import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mem/core/extension/context_extension.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/networking/api_service.dart';
import 'package:mem/core/routing/routes_models.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/features/authentication/widgets/buttom_auth.dart';

class EmailVerficationScreen extends StatefulWidget {
  final String email;
  const EmailVerficationScreen({super.key, required this.email});

  @override
  State<EmailVerficationScreen> createState() => _EmailVerficationScreenState();
}

TextEditingController codeController = TextEditingController();
final ApiService _apiService = GetIt.I<ApiService>();
@override
void dispose() {
  codeController.dispose();
}

class _EmailVerficationScreenState extends State<EmailVerficationScreen> {
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
                  controller: codeController,
                  style: const TextStyle(color: AppPallete.black),
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: "ادخل رمز التحقق",
                    hintStyle: AppStyles.font16LightGray(context),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                AuthtButtom(
                  buttomText: "تأكيد",
                  onPressed: () {
                    if (codeController.text.isNotEmpty) {
                      _apiService
                          .sendCode(widget.email, codeController.text)
                          .then((value) {
                        context.pushReplacementNamed(
                          newPasswordScreen,
                          arguments: {
                            'email': widget.email,
                            'code': codeController.text,
                          },
                        );
                      }).catchError((e) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              'رمز التحقق غير صحيح',
                              style: AppStyles.font20Black(context),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      });
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            'رجاءاً أدخل رمز التحقق',
                            style: AppStyles.font20Black(context),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
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
    );
  }
}
