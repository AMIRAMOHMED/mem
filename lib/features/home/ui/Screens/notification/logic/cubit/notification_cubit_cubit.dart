import 'package:bloc/bloc.dart';
import 'package:mem/core/service/shared_pref/pref_keys.dart';
import 'package:mem/core/service/shared_pref/shared_pref.dart';
import 'package:mem/features/home/ui/Screens/notification/data/repo/notification_repo.dart';
import 'package:mem/features/home/ui/Screens/notification/logic/cubit/notification_cubit_state.dart';

class NotificationCubit extends Cubit<NotificationCubitState> {
  final NotificationRepo _notificationRepo;
  NotificationCubit(this._notificationRepo)
      : super(const NotificationCubitState.initial());

  void fetchNotification() async {
    emit(const NotificationCubitState.loading());

    final token = SharedPref().getString(PrefKeys.accessToken);

    final response =
        await _notificationRepo.getAllNotification("Bearer $token");

    response.when(
      success: (getAllNotificationModel) {
        emit(NotificationCubitState.success(getAllNotificationModel));
      },
      failure: (error) {
        emit(NotificationCubitState.error(
            error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
