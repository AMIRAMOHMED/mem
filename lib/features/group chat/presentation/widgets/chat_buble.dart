import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/resources/constants.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/features/group%20chat/data/model/message_model.dart';

import '../../../../core/resources/assets.dart';

class ChatBubble extends StatelessWidget {
  final MessageModel message;
  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final photo = message.sender.profilePictureUrl;
    print(photo);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          SizedBox(width: 5.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${message.sender.firstName} ${message.sender.lastName}",
                  style: AppStyles.font13Black(context),
                ),
                SizedBox(height: 5.h),
                Text(
                  Constants.dateFormat.format(message.createdAt),
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
                        message.content,
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
