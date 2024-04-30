import 'package:flutter/material.dart';
import 'package:mem/core/themes/app_style.dart';

import '../../../../core/themes/app_pallete.dart';

class CollaborationHeaderText extends StatelessWidget {
  const CollaborationHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      ":لديك موعد جديد \nاحرص على الانضمام في الموعد المحدد",
                      style: AppStyles.font20Black(context),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.calendar_month_rounded,
                      color: AppPallete.black,
                      size: 50,
                    ),
                  ],
                ),
              );
  }
}