import 'package:freezed_annotation/freezed_annotation.dart';
part "exercises_cubit_state.freezed.dart";

@freezed
class ExercisesCubitState<T> with _$ExercisesCubitState {
  const factory ExercisesCubitState.initial() = _Initial;
  const factory ExercisesCubitState.loading() = Loading;
  const factory ExercisesCubitState.success(T data) = Success<T>;
  const factory ExercisesCubitState.error({required String error}) = Error;
}
