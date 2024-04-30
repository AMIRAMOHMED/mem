import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mem/features/authentication/register/logic/cubit/register_state.dart';
import 'package:mem/features/authentication/register/models/register_requset_body.dart';
import 'package:mem/features/authentication/register/repository/register_repo.dart';
import 'package:permission_handler/permission_handler.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterReop _registerRepo;

  RegisterCubit(this._registerRepo) : super(const RegisterState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  XFile? pickImage;
  Future<void> pickImageAction(BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image != null) {
        pickImage = XFile(image.path);

        emit(RegisterState.sucessPickedImage(pickImage!.path));
      }
    } catch (e) {
      final permissionStatus = await Permission.photos.status;

      if (permissionStatus.isDenied) {
        await _showAlertPermissionsDialog(context);
      } else {
        emit(const RegisterState.error(error: 'Failed to pick image'));
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

  void emitRegisterState(String selectedUserOption) async {
    emit(const RegisterState.loading());

    if (pickImage!.path.isEmpty) {
      emit(const RegisterState.error(error: 'Please pick an image'));
      return;
    }

    final response = await _registerRepo.register(
      RegisterRequestBody(
        email: emailController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        password: passwordController.text,
        type: selectedUserOption,
        username: "${firstNameController.text}${lastNameController.text}",
        profilePictureUrl:pickImage!.path,
      ),
    );

    response.when(
      success: (registerResponse) {
        emit(RegisterState.success(registerResponse));
      },
      failure: (error) {
        emit(RegisterState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
