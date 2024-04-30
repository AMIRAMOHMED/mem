// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:mem/core/networking/api_result.dart';
import 'package:mem/core/networking/api_service.dart';
import 'package:mem/features/authentication/register/models/register_requset_body.dart';
import 'package:mem/features/authentication/register/models/register_respons.dart';

import '../../../../core/networking/api_error_handler.dart';

class RegisterReop {
  final ApiService apiService;
  RegisterReop(
    this.apiService,
  );
  Future<ApiResult<RegisterData>> register(
    RegisterRequestBody registerRequestBody,
  ) async {
    try {
      final respone = await apiService.register(registerRequestBody);
      return ApiResult.success(respone);
    } catch (error) {
      return ApiResult<RegisterData>.failure(ErrorHandler.handle(error));
    }
  }
}
