import 'package:flutter/material.dart';
import 'package:mem/core/resources/assets.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/core/widgets/head_container.dart';
import 'package:mem/features/group%20chat/data/model/get_all_groups_response.dart';
import 'package:mem/features/group%20chat/presentation/widgets/chat_buble.dart';

class GroupChatScreen extends StatelessWidget {
  const GroupChatScreen({super.key, required this.groups});
  final GetAllGroupResponseBody groups;


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
            title:  HeadContainer(
              text: "${groups.name}",
              color: AppPallete.mintGreen,
              isINfoIcon: true,
            ),
          ),Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const ChatBubble();
        },
      ),
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
