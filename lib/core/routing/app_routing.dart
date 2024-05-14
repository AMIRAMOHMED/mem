import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem/core/di/injection_container.dart';
import 'package:mem/core/routing/routes_models.dart';
import 'package:mem/features/authentication/login/logic/cubit/login_cubit.dart';
import 'package:mem/features/authentication/register/logic/cubit/register_cubit.dart';
import 'package:mem/features/authentication/login/ui/login_screen.dart';
import 'package:mem/features/authentication/register/ui/screens/register_screen.dart';
import 'package:mem/features/authentication/reset%20password/ui/screens/email_verficiation_screen.dart';
import 'package:mem/features/authentication/reset%20password/ui/screens/new_password_screen.dart';
import 'package:mem/features/authentication/reset%20password/ui/screens/reset_password_screen.dart';
import 'package:mem/features/group%20chat/data/model/get_all_groups_response.dart';
import 'package:mem/features/home/logic/cubit/get_user_info_cubit.dart';
import 'package:mem/features/home/ui/Screens/notification/ui/screens/notification_screen.dart';
import 'package:mem/features/exercises/data/models/exercise_model.dart';
import 'package:mem/features/meeting/data/models/meetings_respons_body.dart';
import 'package:mem/features/meeting/presentation/screens/collaboration_screen.dart';
import 'package:mem/features/exercises/presentation/screens/exercises_screen.dart';
import 'package:mem/features/group%20chat/presentation/screens/group_chat_screen.dart';
import 'package:mem/features/group%20chat/presentation/screens/information_group_screen.dart';
import 'package:mem/features/home/ui/Screens/home_screen.dart';
import 'package:mem/features/meeting/splash%20screen/logic/cubit/vaild_tokrn_cubit.dart';
import 'package:mem/features/meeting/splash%20screen/ui/screen/splash_screen.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<GetUserInfoCubi>(),
            child: const HomeScreen(),
          ),
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
          builder: (_) => CollaborationScreen(
            meetingResponsBody: args as MeetingResponsBody,
          ),
        );
      case groupChatScreen:
        return MaterialPageRoute(
          builder: (_) => ChatScreen(
            meeting: args as GetAllGroupResponseBody,
          ),
        );
      case exerciseScreen:
        return MaterialPageRoute(
          builder: (_) => ExerciseScreen(type: args as ExerciseType),
        );
      case notificationScreen:
        return MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
        );
      case informationGroupScreen:
        return MaterialPageRoute(
          builder: (_) => const InformationGroupScreen(),
        );
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VaildCubit>(),
            child: const SplashScreen(),
          ),
        );

      case newPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VaildCubit>(),
            child: NewPasswordScreen(
        email: (args! as Map<String, dynamic>)['email'] as String,
        code: (args as Map<String, dynamic>)['code'] as String,
      ),
    ),
  );

      case resetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VaildCubit>(),
            child: const ResetPasswordScreen(),
          ),
        );

      case emailVerficationScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VaildCubit>(),
            child:  EmailVerficationScreen(email: args as String,),
          ),
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
