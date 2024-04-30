import 'package:flutter/material.dart';
import 'package:mem/core/resources/assets.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/core/widgets/head_container.dart';
import 'package:mem/features/group%20chat/presentation/widgets/build_chat.dart';

class GroupChatScreen extends StatelessWidget {
  const GroupChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          AppBar(
            automaticallyImplyLeading: false,
            title: const HeadContainer(
              text: 'اسم المجموعة',
              color: AppPallete.mintGreen,
              isINfoIcon: true,
            ),
          ),
          const Expanded(
            child: BuildChatList(),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: '..... اكتب رسالة',
                hintStyle: AppStyles.font16LightGray(context),
                prefix: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    Assets.sendIcon,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
