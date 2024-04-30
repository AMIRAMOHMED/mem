import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/features/authentication/register/logic/cubit/register_cubit.dart';
import 'package:mem/features/authentication/register/ui/widgets/register_blco_listner.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: context.watch<RegisterCubit>().pickImage == null
                ? Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppPallete.borderColor, width: 3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "اختار صوره",
                        style: TextStyle(
                            fontSize: 16, color: AppPallete.borderColor),
                      ),
                    ),
                  )
                : Image.file(
                    File(context.watch<RegisterCubit>().pickImage!.path),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Positioned(
          top: -5,
          right: -5,
          child: Material(
            borderRadius: BorderRadius.circular(16.0),
            color: AppPallete.lightPink,
            child: InkWell(
              splashColor: AppPallete.lightBlueColor,
              onTap: () {
                context.read<RegisterCubit>().pickImageAction(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.add,
                  color: AppPallete.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
