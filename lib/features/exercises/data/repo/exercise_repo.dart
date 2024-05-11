import 'package:mem/core/networking/api_error_handler.dart';
import 'package:mem/core/networking/api_result.dart';
import 'package:mem/core/networking/api_service.dart';
import 'package:mem/features/exercises/data/models/exercise_model.dart';

class ExerciseRepo {
  final ApiService _apiService;
  ExerciseRepo(
    this._apiService,
  );

  Future<ApiResult<List<ExerciseModel>>> getAllExercises(String token) async {
    try {
      final respons = await _apiService.getAllExercises(token);
      return ApiResult.success(respons);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
