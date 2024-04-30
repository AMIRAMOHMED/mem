import 'package:flutter/material.dart';
import 'package:mem/core/resources/assets.dart';
import 'package:mem/core/themes/app_style.dart';

import '../../../../core/themes/app_pallete.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(010),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            child: ClipOval(
              child: Image.asset(
                Assets.profileLogo,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppPallete.lightMintGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "محمد",
                          style: AppStyles.font13Black(context),
                        ),
                        Text(
                          "5:30 م",
                          style: AppStyles.font13Black(context),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.right,
                        "هاي انا نور ",
                        style: AppStyles.font20Black(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
