import 'package:flutter/material.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';

class EmptyContainerState extends StatelessWidget {
  const EmptyContainerState({
    super.key,
    required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 6),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          width: 200.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: AppPallete.lightBlueColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: AppStyles.font24White(context),
            ),
          ),
        ),
      ),
    );
  }
}
