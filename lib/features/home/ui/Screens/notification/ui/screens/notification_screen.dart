import 'package:flutter/material.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/widgets/head_container.dart';
import 'package:mem/features/home/ui/Screens/notification/ui/widget/build_notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              AppBar(
                automaticallyImplyLeading: false,
                title: const HeadContainer(
                  text: ' الاشعارات ',
                  color: AppPallete.mintGreen,
                ),
              ),
              Expanded(
                  child: Center(
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: const BuildNotificationList()))),
            ]),
          ),
        ),
      ),
    );
  }
}
