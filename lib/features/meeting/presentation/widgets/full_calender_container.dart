import 'package:flutter/cupertino.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/widgets/convert_Time.dart';
import 'package:mem/features/meeting/data/models/meetings_respons_body.dart';
import 'package:mem/features/meeting/presentation/widgets/calendar_data.dart';
import 'package:mem/features/meeting/presentation/widgets/custom_container.dart';
import 'package:mem/features/meeting/presentation/widgets/full_clock_item.dart';

class FullClanderContainer extends StatelessWidget {
  const FullClanderContainer({super.key, required this.meeting});

  final MeetingResponsBody meeting;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> parsedDateTime =
        DateTimeUtils.parseDateTime("${meeting.dateTime}");

    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 10, 70, 0),
      child: CustomContainer(
        width: 240.w,
        height: 300.h,
        widget: Column(
          children: [
            Row(
              children: [
                const Expanded(child: SizedBox()),
                CalendarItem(text: "شهر", num: parsedDateTime['month']),
                const SizedBox(width: 15),
                CalendarItem(text: "يوم", num: parsedDateTime['day']),
                const SizedBox(width: 15),
              ],
            ),
             SizedBox(
              height: 10.h,
            ),
            FullClockItem(
              meeting: meeting,
            ),
          ],
        ),
      ),
    );
  }
}
