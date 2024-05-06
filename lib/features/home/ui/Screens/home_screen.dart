import 'package:flutter/material.dart';
import 'package:mem/core/extension/context_extension.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/resources/assets.dart';
import 'package:mem/core/routing/routes_models.dart';
import 'package:mem/core/service/shared_pref/pref_keys.dart';
import 'package:mem/core/service/shared_pref/shared_pref.dart';

import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/features/home/ui/widgets/Drawer/dawer.dart';
import 'package:mem/features/home/ui/widgets/home/build_meeting_list.dart';
import 'package:mem/features/home/ui/widgets/home/build_groups_list.dart';
import 'package:mem/features/home/ui/widgets/home/home_head_text.dart';

import '../widgets/home/build_execrise_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppPallete.black),
          title: Text(
            "الصفحة الرئيسية",
            style: AppStyles.font20Black(context),
          ),
        ),
        drawer: BuildDrawer(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 20.0, 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _shouldShowExerciseItem() == "STUTTERER"
                    ? Column(
                        children: [
                          const HomeHeadText(
                            text: "التمارين",
                          ),
                          const BuildExecriseItemHome(),
                          Divider(
                            height: .5,
                            color: AppPallete.lightGray,
                          ),
                        ],
                      )
                    : Image.asset(
                        Assets.memLogPicture,
                        height: 150.h,
                        width: double.infinity,
                      ),
                const HomeHeadText(
                  text: "المجموعات",
                ),
                // BuildGroupsList(
                //   onGroupItemTap: () {
                //     context.pushName(groupChatScreen);
                //   },
                // ),
                Divider(
                  height: .5,
                  color: AppPallete.lightGray,
                ),
                const HomeHeadText(text: "القوائم"),
             BuildMeetingList(
              // onGroupItemTap: () {
              //   context.pushName(collaborationScreen);
              // },  
             )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _shouldShowExerciseItem() {
    String type = SharedPref().getString(PrefKeys.type) ?? '';

    return type;
  }
}
