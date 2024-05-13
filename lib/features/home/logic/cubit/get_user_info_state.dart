  import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_user_info_state.freezed.dart';
@freezed
class GetUserInfoState <T>with _$GetUserInfoState {
  const factory GetUserInfoState.initial() = _Initial;
    const factory GetUserInfoState.loading() = Loading;
  const factory GetUserInfoState.success(T data) = Success<T>;
  const factory GetUserInfoState.error({required String error}) = Error;
}
  

