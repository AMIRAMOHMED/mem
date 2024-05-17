import 'package:flutter/material.dart';
import 'package:mem/core/resources/assets.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/features/exercises/data/models/exercise_model.dart';
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
    const ExerciseItem(
      text: ' تمارين التنفس و الاسترخاء',
      color: AppPallete.lightBlueColor,
      exerciseType: ExerciseType.breathing,
      image:  Assets.relaxtion,
    ),
    const ExerciseItem(
      text: 'تمارين النطق',
      color: AppPallete.lightPink,
      exerciseType: ExerciseType.yoga,
      image: Assets.speakingLogo,
    ),
    const ExerciseItem(
        text: 'محاكي ' + "3D",
        color: AppPallete.purpleColor,
        exerciseType: ExerciseType.vid_3d,
        image: Assets.threeDModel),
  ];
}
