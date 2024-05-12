import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/resources/assets.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/features/group%20chat/data/model/message_model.dart';

class ChatBubleForOther extends StatelessWidget {
  final MessageModel message;
  const ChatBubleForOther({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${message.sender.firstName} ${message.sender.lastName}",
                  textAlign: TextAlign.right,
                  style: AppStyles.font13Black(context),
                ),
                SizedBox(height: 5.h),
                Text(
                  message.createdAt.toString(),
                  textAlign: TextAlign.right,
                  style: AppStyles.font13Black(context),
                ),
                SizedBox(height: 5.h),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppPallete.darkPink,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    message.content,
                    textAlign: TextAlign.right,
                    style: AppStyles.font20Black(context),
                  ),
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ),
          SizedBox(width: 5.w),
          message.sender.profilePictureUrl == null
              ? const CircleAvatar(
                  radius: 20, backgroundImage: AssetImage(Assets.profileLogo))
              : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 30.h,
                  width: 30.w,
                  child: Image.network(
                    message.sender.profilePictureUrl!,
                  ),
                ),
        ],
      ),
    );
  }
}
