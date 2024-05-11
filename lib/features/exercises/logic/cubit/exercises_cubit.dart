import 'package:bloc/bloc.dart';
import 'package:mem/core/service/shared_pref/pref_keys.dart';
import 'package:mem/core/service/shared_pref/shared_pref.dart';
import 'package:mem/features/exercises/data/models/exercise_model.dart';
import 'package:mem/features/exercises/data/repo/exercise_repo.dart';
import 'package:mem/features/exercises/logic/cubit/exercises_cubit_state.dart';

class ExercisesCubit extends Cubit<ExercisesCubitState<List<ExerciseModel>>> {
  final ExerciseRepo _exercisesRepo;

  ExercisesCubit(this._exercisesRepo)
      : super(const ExercisesCubitState.initial());

  void fetchExercises() async {
    emit(const ExercisesCubitState.loading());

    final token = SharedPref().getString(PrefKeys.accessToken);

    final response = await _exercisesRepo.getAllExercises("Bearer $token");

    response.when(
      success: (model) {
        emit(ExercisesCubitState.success(model));
      },
      failure: (error) {
        emit(ExercisesCubitState.error(
            error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
