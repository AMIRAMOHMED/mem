import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:permission_handler/permission_handler.dart';

class PickImageWidget extends StatelessWidget {
   const PickImageWidget({super.key, required this.saveFile});

  final Function(XFile) saveFile;

  @override
  Widget build(BuildContext context) {
    return PickImageContent(saveFile: saveFile);
  }
}

class PickImageContent extends StatefulWidget {
  final Function(XFile) saveFile;

  const PickImageContent({super.key, required this.saveFile});

  @override
  _PickImageContentState createState() => _PickImageContentState();
}

class _PickImageContentState extends State<PickImageContent> {
  XFile? pickImage;

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
                      border: Border.all(color: AppPallete.borderColor, width: 3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "اختار صوره",
                        style: TextStyle(fontSize: 16, color: AppPallete.borderColor),
                      ),
                    ),
                  )
                : Image.file(
                    File(pickImage!.path),
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
                _pickImageAction(context);
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
        )
      ],
    );
  }

  Future<void> _pickImageAction(BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          
          pickImage = XFile(image.path);
          widget.saveFile(pickImage!);
        });
      }
    } catch (e) {
      final permissionStatus = await Permission.photos.status;

      if (permissionStatus.isDenied) {
        await _showAlertPermissionsDialog(context);
      } else {
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
