import 'package:flutter/material.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/widgets/head_container.dart';
import 'package:mem/features/collaboration/presentation/widgets/collaboration_header_text.dart';
import 'package:mem/features/collaboration/presentation/widgets/full_calender_container.dart';
import 'package:mem/features/collaboration/presentation/widgets/join_button.dart';

class CollaborationScreen extends StatelessWidget {
  const CollaborationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              AppBar(
                automaticallyImplyLeading: false,
                title: const HeadContainer(
                  text: 'التقويم و الجدولة',
                  color: AppPallete.darkPink,
                ),
              ),
              const CollaborationHeaderText(),
              const SizedBox(
                height: 15,
              ),
              const FullClanderContainer(),
              const SizedBox(
                height: 40,
              ),
              JoinButton(
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
