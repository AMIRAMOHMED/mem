import 'package:flutter/material.dart';
import 'package:mem/core/extension/context_extension.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/routing/routes_models.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';

class HeadContainer extends StatelessWidget {
  const HeadContainer({
    super.key,
    required this.text,
    required this.color,
    this.isINfoIcon = false,
  });
  final String text;
  final Color color;
  final bool isINfoIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 280.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: AppPallete.white,
              )),
          Text(
            text,
            style: AppStyles.font24White(context),
          ),
          isINfoIcon
              ? IconButton(
                  onPressed: () {
                    context.pushName(informationGroupScreen);
                  },
                  icon: const Icon(
                    Icons.info_outline_rounded,
                    color: AppPallete.white,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
