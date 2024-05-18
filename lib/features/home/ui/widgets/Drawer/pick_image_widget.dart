import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/features/home/logic/put%20image%20cubit/put_image_cubit.dart';
import 'package:mem/features/home/logic/put%20image%20cubit/put_image_state.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final putImageCubit = context.watch<PutImageCubit>();

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: putImageCubit.pickImage == null
                ? Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppPallete.borderColor, width: 3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "اختر صورة",
                        style: TextStyle(
                            fontSize: 16, color: AppPallete.borderColor),
                      ),
                    ),
                  )
                : Image.file(
                    File(putImageCubit.pickImage!.path),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        if (putImageCubit.state is Loading)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        Positioned(
          top: -5,
          right: -5,
          child: Material(
            borderRadius: BorderRadius.circular(16.0),
            color: AppPallete.pinkColor,
            child: InkWell(
              splashColor: AppPallete.lightBlueColor,
              onTap: () {
                putImageCubit.pickImageAction(context);
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
