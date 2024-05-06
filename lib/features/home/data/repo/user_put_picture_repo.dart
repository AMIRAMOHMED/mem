import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mem/core/networking/api_error_handler.dart';
import 'package:mem/core/networking/api_result.dart';
import 'package:mem/core/networking/api_service.dart';

class UserPutPictureRepo {
  final ApiService _apiService;

  UserPutPictureRepo(this._apiService);

  Future<ApiResult<dynamic>> uploadImage(
     XFile imageFile,String token
  ) async {
    final fromData = FormData();

    fromData.files.add(
      MapEntry('file', await MultipartFile.fromFile(imageFile.path, )),
    );
    try {
      final response = await _apiService.putUserPic(token,fromData);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
