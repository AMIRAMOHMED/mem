import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem/core/extension/context_extension.dart';
import 'package:mem/core/routing/routes_models.dart';
import 'package:mem/core/service/shared_pref/pref_keys.dart';
import 'package:mem/core/service/shared_pref/shared_pref.dart';
import 'package:mem/features/meeting/splash%20screen/logic/cubit/vaild_tokrn_cubit.dart';
import 'package:mem/features/meeting/splash%20screen/ui/widget/splash_bloc_liisnter.dart';
import 'package:mem/features/meeting/splash%20screen/ui/widget/splash_screen_body.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token;

  @override
  void initState() {
    super.initState();
    navigateToNextScreenAfterDelay();
  }

  Future<void> navigateToNextScreenAfterDelay() async {
    await Future.delayed(const Duration(seconds: 3));

    token = await SharedPref().getString(PrefKeys.accessToken);

    if (token == null || token!.isEmpty) {
      context.pushReplacementNamed(loginScreen);
    } else {
      context.read<VaildCubit>().checkValidationToken();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SplashScreenBody(),
          ),
          SplashBlocListener(),
        ],
      ),
    );
  }
}