import 'package:flutter/material.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/resources/assets.dart';
import 'package:mem/core/service/shared_pref/pref_keys.dart';
import 'package:mem/core/service/shared_pref/shared_pref.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/features/home/presentation/widgets/Drawer/build_drawer_list.dart';
import 'package:mem/features/home/presentation/widgets/Drawer/head_drawer.dart';

class BuildDrawer extends StatelessWidget {
  BuildDrawer({super.key});
  final SharedPref _sharedPref = SharedPref();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppPallete.white,
      child: ListView(
        children: [
          SizedBox(
            height: 50.h,
          ),
          HeadDrawer(name: _sharedPref.getString(PrefKeys.displayName) ?? ''),
           SizedBox(
            height: 50.h,
          ),
          const DrawerBuilder(),
          SizedBox(
            height: 200.h,
          ),
          Image.asset(
            Assets.memLogPicture,
            height: 150.h,
          )
        ],
      ),
    );
  }
}
