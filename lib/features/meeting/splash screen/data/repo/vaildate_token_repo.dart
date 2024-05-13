
import 'package:mem/core/networking/api_error_handler.dart';
import 'package:mem/core/networking/api_result.dart';
import 'package:mem/core/networking/api_service.dart';
import 'package:mem/features/authentication/login/data/models/set_firebase_id_request_body.dart';
import 'package:mem/features/meeting/splash%20screen/data/models/token_request_body.dart';

class VaildateTokenRepo {
  final ApiService apiService;

  VaildateTokenRepo(this.apiService);

  Future<ApiResult> vaildateToken(
      TokenRequestBody tokenRequestBody) async {
    try {
      final respons = await apiService.vailadateToken(tokenRequestBody);
    
      return ApiResult.success(respons);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


    Future setFirebaseId(String token, SetFireBaseIdBodyRequest setFireBaseIdBodyRequest) async {
    await apiService.setFirebaseId(  token,setFireBaseIdBodyRequest);
  }

}