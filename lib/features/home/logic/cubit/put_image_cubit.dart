import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mem/core/service/shared_pref/pref_keys.dart';
import 'package:mem/core/service/shared_pref/shared_pref.dart';
import 'package:mem/features/home/data/repo/user_put_picture_repo.dart';
import 'package:mem/features/home/logic/cubit/put_image_state.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PutImageCubit extends Cubit<PutImageState> {
  final UserPutPictureRepo _userPutPictureRepo;
  
  PutImageCubit(this._userPutPictureRepo) : super(const PutImageState.initial());
  
  XFile? pickImage;

  Future<void> pickImageAction(BuildContext context) async {
    final token = SharedPref().getString(PrefKeys.accessToken);
    final status = await Permission.storage.request();
    if (status.isGranted) {
      emit(const PutImageState.loading());
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
        // User canceled image picking
        emit(const PutImageState.initial());
      }
    } else if (status.isPermanentlyDenied) {
      // ignore: use_build_context_synchronously
      _showAlertPermissionsDialog(context);
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
