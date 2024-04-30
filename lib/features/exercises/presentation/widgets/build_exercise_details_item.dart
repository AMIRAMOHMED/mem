import 'package:flutter/material.dart';
import 'package:mem/features/exercises/presentation/widgets/ecercise_datails_item.dart';

class BuildExerciseDetailsItem extends StatelessWidget {
  const BuildExerciseDetailsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    );
  }

  static final List<ExerciseDetailsItem> items = [
    const ExerciseDetailsItem(
      nameExcreise: 'اسم التمرين',
      descraptionExercise:
          "يساعد هذا الفيديو المتلعثم على قدرة الكلام بشكل افضل عن طريق تزويد ثقته ب نفسه التحدث افضل  ",
      videoAssets: 'assets/videoTest.mp4',
    ),
    const ExerciseDetailsItem(
      nameExcreise: 'اسم التمرين',
      descraptionExercise:
          "يساعد هذا الفيديو المتلعثم على قدرة الكلام بشكل افضل عن طريق تزويد ثقته ب نفسهhbjbbhfbvhbv dbvdjvbjd hbvjd التحدث افضل  ",
      videoAssets: 'assets/videoTest.mp4',
    )
  ];
}
