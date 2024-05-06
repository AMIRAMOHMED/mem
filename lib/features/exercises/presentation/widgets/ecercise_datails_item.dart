import 'package:flutter/material.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/features/exercises/presentation/widgets/video_player_item.dart';
import 'package:mem/features/home/ui/widgets/home/home_head_text.dart';

class ExerciseDetailsItem extends StatelessWidget {
  const ExerciseDetailsItem(
      {super.key,
      required this.nameExcreise,
      required this.descraptionExercise,
      required this.videoAssets});
  final String nameExcreise, descraptionExercise, videoAssets;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 15.0, 0),
      child: Column(
        children: [
          HomeHeadText(text: nameExcreise),
          SizedBox(
            height: 15.h,
          ),
          VideoPlayerItem(
            videoAssets: videoAssets,
          ),
          const HomeHeadText(text: ":وصف التمرين"),
          Text(
            descraptionExercise,
            textAlign: TextAlign.right,
            style: AppStyles.font20Black(context),
          ),
          SizedBox(
            height: 15.h,
          ),
          Divider(
            height: 1.h,
            thickness: .5.h,
          ),
        ],
      ),
    );
  }
}
