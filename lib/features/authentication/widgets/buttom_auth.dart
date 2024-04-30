import 'package:flutter/material.dart';
import 'package:mem/core/themes/app_pallete.dart';

class AuthtButtom extends StatelessWidget {
  const AuthtButtom(
      {super.key,
      required this.buttomText,
      required this.onPressed,
      this.color = AppPallete.lightPink,
      required this.textStyle});

  final String buttomText;
  final Color color;
  final VoidCallback onPressed;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: AppPallete.lightGray, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(395, 55),
            backgroundColor: AppPallete.transparentColor,
            shadowColor: AppPallete.transparentColor),
        child: Text(
          buttomText,
          style: textStyle,
        ),
      ),
    );
  }
}
