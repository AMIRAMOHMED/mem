import 'package:mem/core/networking/api_result.dart';
import 'package:mem/core/networking/api_service.dart';
import 'package:mem/features/authentication/login/data/models/login_request_body.dart';
import 'package:mem/features/authentication/login/data/models/login_respons.dart';
import 'package:mem/features/authentication/login/data/models/set_firebase_id_request_body.dart';

import '../../../../../core/networking/api_error_handler.dart';

class LoginRepo {
  final ApiService apiService;

  LoginRepo( this.apiService);

  Future<ApiResult<UserData>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await apiService.login(loginRequestBody);

      
      return ApiResult.success(response );

    } catch (error) {
      return ApiResult<UserData>.failure(ErrorHandler.handle(error));
    }
  }
 Future setFirebaseId(String token, SetFireBaseIdBodyRequest setFireBaseIdBodyRequest) async {
    await apiService.setFirebaseId(  token,setFireBaseIdBodyRequest);
  }

 

  
}
