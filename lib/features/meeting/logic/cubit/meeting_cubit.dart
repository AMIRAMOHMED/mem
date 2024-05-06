import 'package:bloc/bloc.dart';
import 'package:mem/core/service/shared_pref/pref_keys.dart';
import 'package:mem/core/service/shared_pref/shared_pref.dart';
import 'package:mem/features/meeting/data/repo/meetings_repo.dart';
import 'package:mem/features/meeting/logic/cubit/meeting_cubit_state.dart';

class MeetingCubit extends Cubit<MeetingCubitState> {
  final MeetingRepo _meetingsRepo;

  MeetingCubit(this._meetingsRepo) : super(const MeetingCubitState.initial());

  void fetchMeetings() async {
    emit(const MeetingCubitState.loading());

    final token = SharedPref().getString(PrefKeys.accessToken);

    final response = await _meetingsRepo.getAllMeetingsrepo("Bearer $token");

    response.when(
      success: (getAllMeetingModel) {
        emit(MeetingCubitState.success(getAllMeetingModel));
      },
      failure: (error) {
        emit(MeetingCubitState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
