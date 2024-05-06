import 'package:flutter/material.dart';
import 'package:mem/core/resources/assets.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/features/home/ui/widgets/home/execrise.item.dart';

class BuildExecriseItemHome extends StatelessWidget {
  const BuildExecriseItemHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    );
  }

  static final List<ExerciseItem> items = [
    ExerciseItem(
      text: 'تمارين التنفس',
      color: AppPallete.lightBlueColor,
      onTap: () {},
      image: Assets.breathing,
    ),
    ExerciseItem(
      text: 'تمارين الاسترخاء',
      color: AppPallete.lightPink,
      onTap: () {},
      image: Assets.relaxtion,
    ),
    ExerciseItem(
        text: 'محاكي3D',
        color: AppPallete.purpleColor,
        onTap: () {},
        image: Assets.threeDModel),
  ];
}
