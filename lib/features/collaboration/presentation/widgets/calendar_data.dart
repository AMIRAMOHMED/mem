import 'package:flutter/material.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';

class CalendarItem extends StatelessWidget {
  const CalendarItem({
    super.key,
    required this.text,
    required this.num,
  });
  final String text, num;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          Container(
            width: 80,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: AppPallete.lightPink,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(21),
                topRight: Radius.circular(21),
              ),
            ),
            child: Center(
              child: Text(
                text,
                style: AppStyles.font20Black(context),
              ),
            ),
          ),
          Container(
            width: 80,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: AppPallete.skyBlue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(21),
                bottomRight: Radius.circular(21),
              ),
            ),
            child: Column(
              children: [
                Center(
                  child: Text(
                    num,
                    style: AppStyles.font20Black(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
