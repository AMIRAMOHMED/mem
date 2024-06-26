import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mem/core/service/shared_pref/pref_keys.dart';
import 'package:mem/core/service/shared_pref/shared_pref.dart';
import 'package:mem/features/home/data/repo/user_put_picture_repo.dart';
import 'package:mem/features/home/logic/put%20image%20cubit/put_image_state.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PutImageCubit extends Cubit<PutImageState> {
  final UserPutPictureRepo _userPutPictureRepo;
  
  PutImageCubit(this._userPutPictureRepo) : super(const PutImageState.initial());
  
  XFile? pickImage;
   
  Future<PermissionStatus> requestPermission() async {
    PermissionStatus newPermReq;

    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      final androidSdkInt = androidInfo.version.sdkInt;
      if (androidSdkInt < 33) {
        newPermReq = await Permission.storage.request();
      } else {
        newPermReq = await Permission.photos.request();
      }
    } else {
      newPermReq = await Permission.photos.request();
    }
    return newPermReq;
  }

  Future<void> pickImageAction(BuildContext context) async {
    final token = SharedPref().getString(PrefKeys.accessToken);
    final status = await requestPermission();
    if (status.isGranted) {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        final result = await _userPutPictureRepo.uploadImage(image, "Bearer $token");
        result.when(
          success: (_) async{
            pickImage = XFile(image.path);
            await SharedPref().setString(
          PrefKeys.profilePictureUrl,
        image.path ,
        );
            emit(PutImageState.success(pickImage));
          },
          failure: (error) {
            emit(PutImageState.error(error: error.toString()));
            debugPrint('Image Upload Error: $error');
          },
        );
      } else {
        emit(const PutImageState.initial());
      }
    } else if (status.isPermanentlyDenied) {
      _showAlertPermissionsDialog(context);
    }
  } 
Future<void> _showAlertPermissionsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Permissions Denied'),
          content: const Text('Allow access to gallery and photos'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            const TextButton(
              onPressed: openAppSettings,
              child: Text('Settings'),
            ),
          ],
        );
      },
    );
  }
}