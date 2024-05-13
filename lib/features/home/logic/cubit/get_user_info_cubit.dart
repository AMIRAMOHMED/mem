import 'package:bloc/bloc.dart';
import 'package:mem/core/service/shared_pref/pref_keys.dart';
import 'package:mem/core/service/shared_pref/shared_pref.dart';
import 'package:mem/features/home/data/models/user_model.dart';
import 'package:mem/features/home/data/repo/user_put_picture_repo.dart';
import 'package:mem/features/home/logic/cubit/get_user_info_state.dart';

class GetUserInfoCubi extends Cubit<GetUserInfoState> {
  final UserPutPictureRepo _userPutPictureRepo;

  GetUserInfoCubi(this._userPutPictureRepo)
      : super(const GetUserInfoState.initial());
  void fetchUserInfo() async {
    emit(const GetUserInfoState.loading());
    final token = SharedPref().getString(PrefKeys.accessToken);

    final response = await _userPutPictureRepo.getUserInfo("Bearer $token");

    response.when(
      success: (userModel) {

        emit(GetUserInfoState.success(userModel));
      },
      failure: (error) {
        emit(GetUserInfoState.error(error: error.toString()));
      },
    );
  }
}
