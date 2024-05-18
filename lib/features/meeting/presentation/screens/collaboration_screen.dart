import 'package:flutter/material.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/widgets/head_container.dart';
import 'package:mem/features/meeting/data/models/meetings_respons_body.dart';
import 'package:mem/features/meeting/presentation/widgets/collaboration_header_text.dart';
import 'package:mem/features/meeting/presentation/widgets/full_calender_container.dart';
import 'package:mem/features/meeting/presentation/widgets/join_button.dart';

class CollaborationScreen extends StatelessWidget {
  const CollaborationScreen({super.key, required this.meetingResponsBody});
  final MeetingResponsBody meetingResponsBody;
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
                  text: ' الإجتماعات ',
                  color: AppPallete.darkPink,
                ),
              ),
              const CollaborationHeaderText(),
              const SizedBox(
                height: 15,
              ),
              FullClanderContainer(
                meeting: meetingResponsBody,
              ),
              const SizedBox(
                height: 40,
              ),
              JoinButton(
                meeting: meetingResponsBody,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
