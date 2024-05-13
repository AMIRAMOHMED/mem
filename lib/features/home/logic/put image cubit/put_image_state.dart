import 'package:freezed_annotation/freezed_annotation.dart';
part 'put_image_state.freezed.dart';
@freezed
class PutImageState <T>with _$PutImageState {
  const factory PutImageState.initial() = _Initial;
    const factory PutImageState.loading() = Loading;
  const factory PutImageState.success(T data) = Success<T>;
  const factory PutImageState.error({required String error}) = Error;
}
  

