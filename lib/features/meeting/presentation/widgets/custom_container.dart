import 'package:flutter/material.dart';

import '../../../../core/themes/app_pallete.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.width, required this.height, required this.widget});
final double width,height;
final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
                  width: width,
                  height: height,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    boxShadow: const [BoxShadow(blurRadius: 5)],
                    color: AppPallete.borderColor,
                    border: Border.all(color: AppPallete.lightGray),
                    borderRadius: BorderRadius.circular(40),
    ),child: widget,);
  }
}