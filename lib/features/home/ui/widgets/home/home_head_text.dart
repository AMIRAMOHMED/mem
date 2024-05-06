import 'package:flutter/material.dart';
import 'package:mem/core/themes/app_style.dart';

class HomeHeadText extends StatelessWidget {
  const HomeHeadText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Align(
        alignment: Alignment.topRight,
        child: Text(
          text,
          style: AppStyles.font25Black(context),
        ),
      ),
    );
  }
}
