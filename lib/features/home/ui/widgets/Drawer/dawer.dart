import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/resources/assets.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/features/home/logic/cubit/get_user_info_cubit.dart';
import 'package:mem/features/home/ui/widgets/Drawer/build_drawer_list.dart';
import 'package:mem/features/home/ui/widgets/Drawer/head_drawer.dart';

class BuildDrawer extends StatelessWidget {
  BuildDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<GetUserInfoCubi>();
    return Drawer(
      backgroundColor: AppPallete.white,
      child: ListView(
        children: [
          SizedBox(
            height: 50.h,
          ),
          const HeadDrawer(),
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
