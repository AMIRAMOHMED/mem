import 'package:flutter/material.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/features/meeting/presentation/widgets/card_time.dart';

class TimeWidget extends StatelessWidget {
   const TimeWidget({super.key, required this.clock, required this.mintue, required this.pmOrAm});
final String clock ,mintue,pmOrAm;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
           CardTime(
            time:clock,
            width: 57.w,
            heihght: 66.h,
          ),
          Text(':', style: AppStyles.font24Blue(context)),
           CardTime(
            time: mintue,
            width: 57,
            heihght: 66,
          ),
           CardTime(
            time: pmOrAm,
            width: 35,
            heihght: 44,
          )
        ],
      ),
    );
  }
}
