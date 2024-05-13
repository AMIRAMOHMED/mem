import 'package:mem/features/home/data/models/user_model.dart';

class GetUserInfoState {
  final bool isLoading;
  final UserModel? userModel;
  final String? error;

  const GetUserInfoState({
    required this.isLoading,
    this.userModel,
    this.error,
  });

  factory GetUserInfoState.initial() {
    return const GetUserInfoState(isLoading: false);
  }

  factory GetUserInfoState.loading() {
    return const GetUserInfoState(isLoading: true);
  }

  factory GetUserInfoState.success(UserModel userModel) {
    return GetUserInfoState(
      isLoading: false,
      userModel: userModel,
    );
  }

  factory GetUserInfoState.error({String? error}) {
    return GetUserInfoState(
      isLoading: false,
      error: error,
    );
  }
}
