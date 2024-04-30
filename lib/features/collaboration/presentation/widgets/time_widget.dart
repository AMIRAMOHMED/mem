import 'package:flutter/material.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/features/collaboration/presentation/widgets/card_time.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          const CardTime(
            time: '01',
            width: 57,
            heihght: 66,
          ),
          Text(':', style: AppStyles.font24Blue(context)),
          const CardTime(
            time: '30',
            width: 57,
            heihght: 66,
          ),
          const CardTime(
            time: 'ص',
            width: 35,
            heihght: 44,
          )
        ],
      ),
    );
  }
}
