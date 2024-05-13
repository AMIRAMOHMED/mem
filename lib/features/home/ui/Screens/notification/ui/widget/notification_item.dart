import 'package:flutter/material.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/features/home/ui/Screens/notification/data/model/notification_respons_body.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.notificationResponsBody,
  });
  final NotificationResponsBody notificationResponsBody;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 6),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          width: 200.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(173, 228, 218, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              " ${notificationResponsBody.message}",
              style: AppStyles.font24White(context),
            ),
          ),
        ),
      ),
    );
  }
}
