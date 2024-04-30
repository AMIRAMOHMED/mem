import 'package:dio/dio.dart';
import 'package:mem/features/authentication/login/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:mem/features/authentication/login/data/repository/login_repo.dart';
import 'package:mem/features/authentication/register/logic/cubit/register_cubit.dart';
import 'package:mem/features/authentication/register/repository/register_repo.dart';

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
}