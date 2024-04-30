// ignore_for_file: avoid_print, use_build_context_synchronously


import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/features/authentication/register/logic/cubit/register_cubit.dart';
import 'package:permission_handler/permission_handler.dart';

class PickImageWidget extends StatefulWidget {
  const PickImageWidget({super.key, });

  @override
  State<PickImageWidget> createState() => _PickImageWidgetState();
}

@override


class _PickImageWidgetState extends State<PickImageWidget> {
  XFile? pickImage;
  bool isLoading = false;


@override
  void initState() {
  super.initState(
  );

  
}
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: pickImage == null
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
                : Stack(
                    children: [
                      Image.file(
                        File(pickImage!.path),
                        fit: BoxFit.cover,
                      ),
                      isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : Container(),
                    ],
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
              onTap: () => pickImageAction(context),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.add,
                  color: AppPallete.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Future pickImageAction(BuildContext context) async {
    try {
      setState(() => isLoading = true);
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() => isLoading = false);

      if (image != null) {
        setState(() {
          pickImage = XFile(image.path);
            context.read<RegisterCubit>().updatePickImage(XFile(image.path));

        });
      }
    } catch (e) {
      final permissionStatus = await Permission.photos.status;

      if (permissionStatus.isDenied) {
        await _showAlertPermissionsDialog(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to pick image')),
        );
        debugPrint('Image Exception ==> $e');
      }
    }
  }

  Future<void> _showAlertPermissionsDialog(BuildContext context) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Permissions Denied'),
          content: const Text('Allow access to gallery and photos'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            const CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: openAppSettings,
              child: Text('Settings'),
            ),
          ],
        );
      },
    );
  }
}
