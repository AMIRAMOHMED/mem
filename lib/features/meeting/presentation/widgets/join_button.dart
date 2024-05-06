
import 'package:flutter/material.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/features/meeting/data/models/meetings_respons_body.dart';
import 'package:mem/features/meeting/presentation/widgets/custom_container.dart';

class JoinButton extends StatelessWidget {
  const JoinButton({super.key, required this.meeting});

  final MeetingResponsBody meeting;

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse("${meeting.url}");

    return GestureDetector(
      onTap: () {
        _launchUrl(url);
      },
      child:  CustomContainer(
        height: 80.h,
        width: 200.w,
        widget: const Text(
          "انضم إلى الموعد",
          style: TextStyle(color: AppPallete.black, fontSize: 25),
        ),
      ),
    );
  }

 Future<void> _launchUrl( url) async {
  if (await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
}
