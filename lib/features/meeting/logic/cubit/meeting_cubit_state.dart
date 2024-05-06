import 'package:freezed_annotation/freezed_annotation.dart';
part"meeting_cubit_state.freezed.dart";
@freezed
class MeetingCubitState<T> with _$MeetingCubitState {
  const factory MeetingCubitState.initial() = _Initial;
  const factory MeetingCubitState.loading() = Loading;
  const factory MeetingCubitState.success(T data) = Success<T>;
  const factory MeetingCubitState.error({required String error}) = Error;
}
