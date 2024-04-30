import 'package:dio/dio.dart';
import 'package:mem/core/networking/api_constants.dart';
import 'package:mem/features/authentication/login/data/models/login_request_body.dart';
import 'package:mem/features/authentication/register/models/register_requset_body.dart';
import 'package:mem/features/authentication/register/models/register_respons.dart';
import 'package:retrofit/http.dart';

import '../../features/authentication/login/data/models/login_respons.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseURL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

@POST(ApiConstants.loginEndpoint)
  Future<UserData> login(
    @Body() LoginRequestBody loginRequestBody,
  );

@POST(ApiConstants.registerEndpoint)
Future<RegisterData>register(
@Body() RegisterRequestBody registerRequestBody,
);

}