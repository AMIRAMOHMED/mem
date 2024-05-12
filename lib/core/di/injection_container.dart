import 'package:dio/dio.dart';
import 'package:mem/features/authentication/login/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:mem/features/authentication/login/data/repository/login_repo.dart';
import 'package:mem/features/authentication/register/logic/cubit/register_cubit.dart';
import 'package:mem/features/authentication/register/repository/register_repo.dart';
import 'package:mem/features/group%20chat/data/repo/get_all_groups_repo.dart';
import 'package:mem/features/group%20chat/logic/group%20chat%20cubit/group_chat_cubit.dart';
import 'package:mem/features/exercises/data/repo/exercise_repo.dart';
import 'package:mem/features/exercises/logic/cubit/exercises_cubit.dart';
import 'package:mem/features/home/ui/Screens/notification/data/repo/notification_repo.dart';
import 'package:mem/features/home/ui/Screens/notification/logic/cubit/notification_cubit_cubit.dart';
import 'package:mem/features/meeting/data/repo/meetings_repo.dart';
import 'package:mem/features/meeting/logic/cubit/meeting_cubit.dart';
import 'package:mem/features/home/data/repo/user_put_picture_repo.dart';
import 'package:mem/features/home/logic/cubit/put_image_cubit.dart';
import 'package:mem/features/meeting/splash%20screen/data/repo/vaildate_token_repo.dart';
import 'package:mem/features/meeting/splash%20screen/logic/cubit/vaild_tokrn_cubit.dart';

import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

// register
  getIt.registerLazySingleton<RegisterReop>(() => RegisterReop(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));

  //check token

  getIt.registerLazySingleton<VaildateTokenRepo>(
      () => VaildateTokenRepo(getIt()));
  getIt.registerFactory<VaildCubit>(() => VaildCubit(getIt()));

//meeting
  getIt.registerLazySingleton<MeetingRepo>(() => MeetingRepo(getIt()));
  getIt.registerFactory<MeetingCubit>(() => MeetingCubit(getIt()));

  //putpictute

  getIt.registerLazySingleton<UserPutPictureRepo>(
      () => UserPutPictureRepo(getIt()));
  getIt.registerFactory<PutImageCubit>(() => PutImageCubit(getIt()));

  //notification

  getIt
      .registerLazySingleton<NotificationRepo>(() => NotificationRepo(getIt()));
  getIt.registerFactory<NotificationCubit>(() => NotificationCubit(getIt()));

  // group chat
  getIt.registerLazySingleton<GroupRepo>(() => GroupRepo(getIt()));
  getIt.registerFactory<GroupChatCubit>(() => GroupChatCubit(getIt()));
  //exercises
  getIt.registerLazySingleton<ExerciseRepo>(() => ExerciseRepo(getIt()));
  getIt.registerFactory<ExercisesCubit>(() => ExercisesCubit(getIt()));
}
