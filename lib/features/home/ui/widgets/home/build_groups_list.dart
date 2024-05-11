import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem/core/di/injection_container.dart';
import 'package:mem/core/extension/context_extension.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/routing/routes_models.dart';
import 'package:mem/core/service/shared_pref/pref_keys.dart';
import 'package:mem/core/service/shared_pref/shared_pref.dart';
import 'package:mem/features/group%20chat/logic/group%20chat%20cubit/group_chat_cubit.dart';
import 'package:mem/features/group%20chat/logic/group%20chat%20cubit/group_chat_state.dart';
import 'package:mem/features/home/ui/widgets/home/empty_container_state.dart';
import 'package:mem/features/home/ui/widgets/home/group_item.dart';

class BuildGroupsList extends StatelessWidget {
  BuildGroupsList({
    super.key,
  });
  final SharedPref _sharedPref = SharedPref();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GroupChatCubit>()..fetchGroups(),
      child: BlocBuilder<GroupChatCubit, GroupChatState>(
        builder: (context, state) {
          return SizedBox(
            height: _sharedPref.getString(PrefKeys.type) == "STUTTERER"
                ? 120.0.h
                : 300.h,
            child: _buildGroupsList(context, state),
          );
        },
      ),
    );
  }


Widget _buildGroupsList(BuildContext context, GroupChatState state) {
    return BlocBuilder<GroupChatCubit, GroupChatState>(
      builder: (context, state) {
        return state.when(
          initial: () => Container(),
          error: (errorMsg) => Center(
            child: Text("Error: $errorMsg"),
          ),
          loading: () => const CircularProgressIndicator(),
          success: (groupList) {
            if (groupList.isEmpty) {
              return const EmptyContainerState(
                text: 'ليس لديك جروبات',
              );
            } else {
              return ListView.builder(
                scrollDirection:
                    _sharedPref.getString(PrefKeys.type) == "STUTTERER"
                        ? Axis.horizontal
                        : Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemCount: groupList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    context.pushName(groupChatScreen,
                        arguments: groupList[index]);
                  },
                  child: GrouppItem(groups: groupList[index]),
                ),
              );
            }
          },
        );
      },
    );
  }
}




