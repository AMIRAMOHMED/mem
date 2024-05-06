import 'package:flutter/material.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';

class CardTime extends StatelessWidget {
  const CardTime(
      {super.key,
      required this.time,
      required this.width,
      required this.heihght});
  final String time;
  final double width, heihght;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: heihght,
      child: Card(
        elevation: 1,
        color: AppPallete.lightPink,
        child: Center(
          child: Text(time, style: AppStyles.font20Black(context)),
        ),
      ),
    );
  }
}
