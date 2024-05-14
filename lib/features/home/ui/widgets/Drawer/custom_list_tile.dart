import 'package:flutter/material.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key, required this.text, required this.onTap, required this.icon});

  final String text;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppPallete.pinkColor,
        size: 30,
      ),
      splashColor: AppPallete.pinkColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
      title: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: AppStyles.font20Black(context),
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
