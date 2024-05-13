import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mem/core/networking/api_error_handler.dart';
import 'package:mem/core/networking/api_result.dart';
import 'package:mem/core/networking/api_service.dart';
import 'package:mem/features/home/data/models/user_model.dart';

class UserPutPictureRepo {
  final ApiService _apiService;

  UserPutPictureRepo(this._apiService);

  Future<ApiResult<dynamic>> uploadImage(XFile imageFile, String token) async {
    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile.path, filename: 'image.jpg'),
      });

      final response = await _apiService.putUserPic(token, formData);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UserModel>> getUserInfo(String token) async {
    try {
      final response = await _apiService.getUserIno(token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
