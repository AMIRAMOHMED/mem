import 'package:flutter/material.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/themes/app_style.dart';

class GroupItem extends StatelessWidget {
  const GroupItem({
    super.key,
    required this.text,
    required this.color,
  });
  final String text;
  final Color color;
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
            color: color,
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
