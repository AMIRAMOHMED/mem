import 'package:flutter/material.dart';
import 'package:mem/core/resources/assets.dart';

import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';

class GoogleAuthtButtom extends StatelessWidget {
  const GoogleAuthtButtom({
    super.key,
    required this.buttomText,
    required this.onPressed,
  });
  final String buttomText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppPallete.white,
        border: Border.all(color: AppPallete.lightGray, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(290, 70),
            backgroundColor: AppPallete.transparentColor,
            shadowColor: AppPallete.transparentColor),
        child: Row(
          children: [
            Image.asset(
            Assets.googleLogo
            ,
            ),
            Text(
              buttomText,
              style: AppStyles.font16Blue(context),
            ),
          ],
        ),
      ),
    );
  }
}
