import 'package:flutter/material.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/features/group%20chat/data/model/get_all_groups_response.dart';

class GrouppItem extends StatelessWidget {
  const GrouppItem({
    required this.groups,
    super.key,
  });
  final GetAllGroupResponseBody groups;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 6),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          width: 200.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: AppPallete.pinkColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              " ${groups.name}",
              style: AppStyles.font24White(context),
            ),
          ),
        ),
      ),
    );
  }
}
