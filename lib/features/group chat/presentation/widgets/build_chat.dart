import 'package:flutter/material.dart';
import 'package:mem/features/group%20chat/presentation/widgets/chat_buble.dart';

class BuildChatList extends StatelessWidget {
  const BuildChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const ChatBuble();
      },
    );
  }
}
