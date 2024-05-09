import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_cubit_state.freezed.dart';
@freezed
class NotificationCubitState <T>with _$NotificationCubitState {
  const factory NotificationCubitState.initial() = _Initial;
    const factory NotificationCubitState.loading() = Loading;
  const factory NotificationCubitState.success(T data) = Success<T>;
  const factory NotificationCubitState.error({required String error}) = Error;
}
