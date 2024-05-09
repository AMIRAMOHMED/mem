import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem/core/app/bloc_abserver.dart';
import 'package:mem/core/di/injection_container.dart';
import 'package:mem/core/routing/app_routing.dart';
import 'package:mem/core/routing/routes_models.dart';
import 'package:mem/core/service/shared_pref/pref_keys.dart';
import 'package:mem/core/service/shared_pref/shared_pref.dart';
import 'package:mem/core/themes/app_theme.dart';
import 'package:mem/firebase_options.dart';

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

class Mem extends StatelessWidget {
  const Mem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes().onGenerateRoute,
      theme: AppTheme.darkTthemeMode,
      initialRoute: SharedPref().getBoolean(PrefKeys.isLogin) == true
          ? homeScreen
          : loginScreen,
    );
  }
}


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.setAutoInitEnabled(true);

  await SharedPref().instantiatePreferences();
  await setupGetIt();
  Bloc.observer = AppBlocObserver();

  runApp(const Mem());
}
