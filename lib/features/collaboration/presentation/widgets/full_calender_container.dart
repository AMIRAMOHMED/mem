import 'package:flutter/cupertino.dart';
import 'package:mem/features/collaboration/presentation/widgets/calendar_data.dart';
import 'package:mem/features/collaboration/presentation/widgets/custom_container.dart';
import 'package:mem/features/collaboration/presentation/widgets/full_clock_item.dart';

class FullClanderContainer extends StatelessWidget {
  const FullClanderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(50, 10, 70, 0),
      child: CustomContainer(
        width: 240,
        height: 300,
        widget: Column(
          children: [
            Row(
              children: [
                Expanded(child: SizedBox()),
                CalendarItem(text: "شهر", num: "4"),
                SizedBox(width: 15),
                CalendarItem(text: "يوم", num: "10"),
                SizedBox(width: 15),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            FullClockItem(),
          ],
        ),
      ),
    );
  }
}
