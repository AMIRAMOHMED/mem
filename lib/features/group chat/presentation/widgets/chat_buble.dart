import 'package:flutter/material.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/resources/assets.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';


class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(Assets.profileLogo)
          ),
           SizedBox(width: 5.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "الاسم",
                  style: AppStyles.font13Black(context),
                ),
                SizedBox(height: 5.h),
                Text(
                  "الوقت",
                  style: AppStyles.font13Black(context),
                ),
                SizedBox(height: 5.h),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppPallete.lightPink,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "vgf bvbvb درزدزر دزردزردز زدزددرزدز زدزردرز زدزدرو زدزر  bnbnmbm nbnm زدزردرزدر  زدرزدرز زدرزدر vb",
                        textAlign: TextAlign.right,
                        style: AppStyles.font20Black(context),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}