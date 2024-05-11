import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_chat_state.freezed.dart';
@freezed
class GroupChatState<T> with _$GroupChatState {
  const factory GroupChatState.initial() = _Initial;
    const factory GroupChatState.loading() = Loading;
  const factory GroupChatState.success(T data) = Success<T>;
  const factory GroupChatState.error({required String error}) = Error;
}