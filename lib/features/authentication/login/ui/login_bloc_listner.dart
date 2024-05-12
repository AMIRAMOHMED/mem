import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem/core/routing/routes_models.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/features/authentication/login/logic/cubit/login_cubit.dart';
import 'package:mem/features/authentication/login/logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: AppPallete.gray,
                ),
              ),
            );
          },
          success: (loginResponse) async {
            Navigator.of(context).pop(); 
            Navigator.of(context)
                .pushReplacementNamed(homeScreen); 
          },
          error: (error) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  'برجاء ادخال جميع البيانات بشكل صحيح',
                  style: AppStyles.font20Black(context),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
