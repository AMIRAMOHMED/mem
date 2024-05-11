import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem/core/di/injection_container.dart';
import 'package:mem/features/exercises/data/models/exercise_model.dart';
import 'package:mem/features/exercises/logic/cubit/exercises_cubit.dart';
import 'package:mem/features/exercises/logic/cubit/exercises_cubit_state.dart';
import 'package:mem/features/exercises/presentation/widgets/ecercise_datails_item.dart';

class BuildExerciseDetailsItem extends StatelessWidget {
  final ExerciseType type;
  const BuildExerciseDetailsItem({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ExercisesCubit>()..fetchExercises(),
      child:
          BlocBuilder<ExercisesCubit, ExercisesCubitState<List<ExerciseModel>>>(
        builder: (context, state) {
          return state.when(
            initial: () => Container(),
            error: (errorMSG) => Center(child: Text(errorMSG)),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (exercisesList) {
              final finalList = exercisesList
                  .where((element) => element.type == type)
                  .toList();

              if (finalList.isEmpty) {
                return const Center(child: Text('لا يوجد تمارين'));
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: finalList.length,
                itemBuilder: (context, index) {
                  final exercise = finalList[index] as ExerciseModel;
                  return ExerciseDetailsItem(
                    nameExcreise: exercise.name,
                    descraptionExercise: exercise.description,
                    videoAssets: exercise.mediaUrl,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
