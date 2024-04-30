import 'package:flutter/material.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/resources/assets.dart';
import 'package:mem/core/themes/app_style.dart';

class HeadDrawer extends StatelessWidget {
  final String name;

  const HeadDrawer({super.key, required this.name});
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              Assets.profileLogo,
              width: 100.h,
              height: 100.h,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
           name,
            style: AppStyles.font20Black(context),
          ),
        ],
      ),
    );
  }
}