import 'package:freezed_annotation/freezed_annotation.dart';
part 'vaild_tokrn_state.freezed.dart';
@freezed
class VaildState<T> with _$VaildState {
  const factory VaildState.initial() = _Initial;
    const factory VaildState.loading() = Loading;
  const factory VaildState.success(T data) = Success<T>;
  const factory VaildState.error({required String error}) = Error;
}