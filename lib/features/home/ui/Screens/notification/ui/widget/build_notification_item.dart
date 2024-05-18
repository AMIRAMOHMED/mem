import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem/core/di/injection_container.dart';
import 'package:mem/features/home/ui/Screens/notification/logic/cubit/notification_cubit_cubit.dart';
import 'package:mem/features/home/ui/Screens/notification/logic/cubit/notification_cubit_state.dart';
import 'package:mem/features/home/ui/widgets/home/empty_container_state.dart';

import 'notification_item.dart';

class BuildNotificationList extends StatelessWidget {
  const BuildNotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocProvider(
        create: (context) => getIt<NotificationCubit>()..fetchNotification(),
        child: BlocBuilder<NotificationCubit, NotificationCubitState>(
          builder: (context, state) {
            return state.when(
              initial: () => Container(),
              error: (errorMsg) => Center(
                child: Text("Error: $errorMsg"),
              ),
              loading: () => const CircularProgressIndicator(),
              success: (notificationList) {
                if (notificationList.isEmpty) {
                  return const EmptyContainerState(
                    text: 'ليس لديك إشعارات',
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemCount: notificationList.length,
                    itemBuilder: (context, index) => Center(
                      child: NotificationItem(
                        notificationResponsBody: notificationList[index],
                      ),
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
