import 'package:flutter/material.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/widgets/head_container.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/themes/app_style.dart';
class InformationGroupScreen extends StatelessWidget {
  const InformationGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          AppBar(
            automaticallyImplyLeading: false,
            title: const HeadContainer(
              text: 'تفاصيل المجموعة',
            
              color: AppPallete.mintGreen,
              
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "20 عدد الاعضاء",
                  style: AppStyles.font20Black(context),
                ),
                Text(
                  "اسم المجموعة",
                  style: AppStyles.font20Black(context),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(010),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        child: ClipOval(
                          child: Image.asset(
                            Assets.profileLogo,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "الاسم",
                        style: AppStyles.font20Black(context),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Material(
              color: AppPallete.darkPink,
              borderRadius: BorderRadius.circular(15),
              child: TextButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "الخروج",
                    style: AppStyles.font20Black(context),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 80.h,
          )
        ],
      ),
    );
  }
}
