import 'package:flutter/material.dart';
import 'package:mem/core/widgets/head_container.dart';
import 'package:mem/features/exercises/data/models/exercise_model.dart';
import 'package:mem/features/exercises/presentation/widgets/build_exercise_details_item.dart';

import '../../../../core/themes/app_pallete.dart';

class ExerciseScreen extends StatelessWidget {
  final ExerciseType type;
  const ExerciseScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              AppBar(
                automaticallyImplyLeading: false,
                title: const HeadContainer(
                  text: "التمارين",
                  color: AppPallete.purpleColor,
                ),
              ),
              BuildExerciseDetailsItem(type: type)
            ],
          ),
        ),
      ),
    );
  }
}
