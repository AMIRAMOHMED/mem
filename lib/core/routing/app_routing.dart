import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem/core/di/injection_container.dart';
import 'package:mem/core/routing/routes_models.dart';
import 'package:mem/features/authentication/login/logic/cubit/login_cubit.dart';
import 'package:mem/features/authentication/register/logic/cubit/register_cubit.dart';
import 'package:mem/features/authentication/login/ui/login_screen.dart';
import 'package:mem/features/authentication/register/ui/screens/register_screen.dart';
import 'package:mem/features/collaboration/presentation/screens/collaboration_screen.dart';
import 'package:mem/features/exercises/presentation/screens/exercises_screen.dart';
import 'package:mem/features/group%20chat/presentation/screens/group_chat_screen.dart';
import 'package:mem/features/group%20chat/presentation/screens/information_group_screen.dart';
import 'package:mem/features/home/presentation/Screens/home_screen.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
     
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );
      case collaborationScreen:
        return MaterialPageRoute(
          builder: (_) => const CollaborationScreen(),
        );
      case groupChatScreen:
        return MaterialPageRoute(
          builder: (_) => const GroupChatScreen(),
        );
      case exerciseScreen:
        return MaterialPageRoute(
          builder: (_) => const ExerciseScreen(),
        );
      case informationGroupScreen:
        return MaterialPageRoute(
          builder: (_) => const InformationGroupScreen(),
    
        );
    
    default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }

  }
}
