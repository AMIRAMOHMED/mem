import 'package:flutter/material.dart';
import 'package:mem/core/widgets/head_container.dart';
import 'package:mem/features/exercises/presentation/widgets/build_exercise_details_item.dart';

import '../../../../core/themes/app_pallete.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

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
              const BuildExerciseDetailsItem()
            ],
          ),
        ),
      ),
    );
  }
}
