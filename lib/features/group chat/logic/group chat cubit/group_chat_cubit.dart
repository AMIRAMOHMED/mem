
import 'package:bloc/bloc.dart';
import 'package:mem/core/service/shared_pref/pref_keys.dart';
import 'package:mem/core/service/shared_pref/shared_pref.dart';
import 'package:mem/features/group%20chat/data/repo/get_all_groups_repo.dart';
import 'package:mem/features/group%20chat/logic/group%20chat%20cubit/group_chat_state.dart';

class GroupChatCubit extends Cubit<GroupChatState> {
  final GroupRepo _groupRepo;

  GroupChatCubit(this._groupRepo) : super(const GroupChatState.initial()) ;

  final token = SharedPref().getString(PrefKeys.accessToken);

  void fetchGroups() async {
    emit(const GroupChatState.loading());

    final response = await _groupRepo.getAllGroups("Bearer $token");

    response.when(
      success: (getAllGroupResponseBody) {
        emit(GroupChatState.success(getAllGroupResponseBody));
      },
      failure: (error) {
        emit(GroupChatState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

 
 
}