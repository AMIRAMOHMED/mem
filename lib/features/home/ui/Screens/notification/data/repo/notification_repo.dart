
import 'package:mem/core/networking/api_error_handler.dart';
import 'package:mem/core/networking/api_result.dart';
import 'package:mem/features/home/ui/Screens/notification/data/model/notification_respons_body.dart';

import '../../../../../../../core/networking/api_service.dart';

class NotificationRepo {
  final ApiService _apiService;
  NotificationRepo(
    this._apiService,
  );


  Future<ApiResult<List<NotificationResponsBody>>> getAllNotification(
      String token) async {
    try {
      final respons = await _apiService.getAllNotification(token);
      return ApiResult.success(respons);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
