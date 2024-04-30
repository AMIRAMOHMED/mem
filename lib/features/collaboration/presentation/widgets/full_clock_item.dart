import 'package:flutter/material.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/features/collaboration/presentation/widgets/time_widget.dart';

class FullClockItem extends StatelessWidget {
  const FullClockItem({super.key});

  @override
  Widget build(BuildContext context) {
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
        const TimeWidget(),
      ],
    );
  }
}
