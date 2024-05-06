import 'package:flutter/material.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/core/widgets/convert_Time.dart';
import 'package:mem/features/meeting/data/models/meetings_respons_body.dart';
import 'package:mem/features/meeting/presentation/widgets/time_widget.dart';

class FullClockItem extends StatelessWidget {
  const FullClockItem({super.key, required this.meeting});
  final MeetingResponsBody meeting;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> parsedDateTime =
        DateTimeUtils.parseDateTime("${meeting.dateTime}");
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(
              Icons.watch_later_outlined,
              color: AppPallete.black,
            ),
            Text(
              " فى تمام الساعه ",
              style: AppStyles.font20Black(context),
            ),
          ],
        ),
        TimeWidget(
          clock: parsedDateTime['hour'],
          mintue: parsedDateTime['minute'],
          pmOrAm: parsedDateTime['amPm'],
        ),
      ],
    );
  }
}
