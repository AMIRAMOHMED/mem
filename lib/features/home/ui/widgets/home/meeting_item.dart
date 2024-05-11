import 'package:flutter/material.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/features/meeting/data/models/meetings_respons_body.dart';

class MeetingItem extends StatelessWidget {
  const MeetingItem({
    required this.meeting,
    super.key,
  });
  final MeetingResponsBody meeting;
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
            color: AppPallete.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              " ${meeting.name}",
              style: AppStyles.font24White(context),
            ),
          ),
        ),
      ),
    );
  }
}
