// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mem/core/networking/api_error_handler.dart';
import 'package:mem/core/networking/api_result.dart';
import 'package:mem/core/networking/api_service.dart';
import 'package:mem/features/meeting/data/models/meetings_respons_body.dart';

class MeetingRepo {
  final ApiService _apiService;
  MeetingRepo(
    this._apiService,
  );


  Future<ApiResult<List<MeetingResponsBody>>> getAllMeetingsrepo(
      String token) async {
    try {
      final respons = await _apiService.getAllMeetings(token);
      return ApiResult.success(respons);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
