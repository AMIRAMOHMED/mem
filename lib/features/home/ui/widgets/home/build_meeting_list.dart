import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem/core/extension/context_extension.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/routing/routes_models.dart';

import 'package:mem/features/home/ui/widgets/home/empty_container_state.dart';
import 'package:mem/features/meeting/logic/cubit/meeting_cubit.dart';
import 'package:mem/features/meeting/logic/cubit/meeting_cubit_state.dart';
import 'package:mem/features/home/ui/widgets/home/meeting_item.dart';

import '../../../../../core/di/injection_container.dart';

class BuildMeetingList extends StatelessWidget {
  const BuildMeetingList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MeetingCubit>()..fetchMeetings(),
      child: BlocBuilder<MeetingCubit, MeetingCubitState>(
        builder: (context, state) {
          return SizedBox(
            height: 120.h,
            child: _buildMeetingList(context, state),
          );
        },
      ),
    );
  }

  Widget _buildMeetingList(BuildContext context, MeetingCubitState state) {
    return BlocBuilder<MeetingCubit, MeetingCubitState>(
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          error: (errorMsg) => Center(
            child: Text("Error: $errorMsg"),
          ),
          loading: () => const CircularProgressIndicator(),
          success: (meetingList) {
            if (meetingList.isEmpty) {
              return const EmptyContainerState(
                text: 'ليس لديك إجتماعات',
              );
            } else {
              return ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: meetingList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    context.pushName(collaborationScreen,
                        arguments: meetingList[index]);
                  },
                  child: MeetingItem(meeting: meetingList[index]),
                ),
              );
            }
          },
        );
      },
    );
  }
}
