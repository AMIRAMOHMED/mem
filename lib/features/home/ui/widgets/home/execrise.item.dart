import 'package:flutter/material.dart';
import 'package:mem/core/extension/context_extension.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/routing/routes_models.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/features/exercises/data/models/exercise_model.dart';

class ExerciseItem extends StatelessWidget {
  const ExerciseItem({
    super.key,
    required this.text,
    required this.color,
    required this.image,
    required this.exerciseType,
  });

  final ExerciseType exerciseType;
  final String text;
  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 6),
      child: GestureDetector(
        onTap: () {
          context.pushName(exerciseScreen, arguments: exerciseType);
        },
        child: Container(
          width: 320.w,
          height: 75.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(image),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    text,
                    style: AppStyles.font20Black(context),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
