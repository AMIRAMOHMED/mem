import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem/core/extension/context_extension.dart';
import 'package:mem/core/routing/routes_models.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/features/meeting/splash%20screen/logic/cubit/vaild_tokrn_cubit.dart';
import 'package:mem/features/meeting/splash%20screen/logic/cubit/vaild_tokrn_state.dart';



class SplashBlocListener extends StatelessWidget {
  const SplashBlocListener({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<VaildCubit, VaildState>(
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
            context.pop();
            context.pushReplacementNamed(homeScreen);
          },
          error: (error) {
            context.pushReplacementNamed(loginScreen);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

}