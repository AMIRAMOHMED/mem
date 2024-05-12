import 'package:flutter/material.dart';
import 'package:mem/core/extension/context_extension.dart';
import 'package:mem/core/routing/routes_models.dart';
import 'package:mem/core/service/shared_pref/pref_keys.dart';
import 'package:mem/features/home/ui/widgets/Drawer/custom_list_tile.dart';

import '../../../../../core/service/shared_pref/shared_pref.dart';

class DrawerBuilder extends StatelessWidget {
  const DrawerBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => items[index](context),
    );
  }

  static final List<Function(BuildContext)> items = [
    (context) => CustomListTile(
          icon: Icons.notification_important_outlined,
          text: "الإشعارات",
          onTap: () {
            context.pushReplacementNamed(notificationScreen);
          },
        ),
    (context) => CustomListTile(
          icon: Icons.logout_outlined,
          text: "تسجيل الخروج",
          onTap: () async {
            await SharedPref().setBoolean(PrefKeys.isLogin, false);

            SharedPref().clearPreferences();
            // ignore: use_build_context_synchronously
            context.pushReplacementNamed(loginScreen);
          },
        ),
  ];
}
