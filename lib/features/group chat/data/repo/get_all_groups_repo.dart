
import 'package:mem/core/networking/api_error_handler.dart';
import 'package:mem/core/networking/api_result.dart';
import 'package:mem/core/networking/api_service.dart';
import 'package:mem/features/group%20chat/data/model/get_all_groups_response.dart';
class GroupRepo {
  final ApiService _apiService;

  GroupRepo(this._apiService);

  Future<ApiResult<List<GetAllGroupResponseBody>>> getAllGroups(
      String token) async {
    try {

      final respons = await _apiService.getAllGroups(token);
      return ApiResult.success(respons);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

 
}