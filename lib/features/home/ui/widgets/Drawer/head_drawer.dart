import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem/core/di/injection_container.dart';
import 'package:mem/core/extension/num_extension.dart';

import 'package:mem/core/themes/app_style.dart';
import 'package:mem/features/home/logic/cubit/get_user_info_cubit.dart';
import 'package:mem/features/home/logic/cubit/get_user_info_state.dart';
import 'package:mem/features/home/logic/put%20image%20cubit/put_image_cubit.dart';
import 'package:mem/features/home/ui/widgets/Drawer/pick_image_widget.dart';

class HeadDrawer extends StatelessWidget {
  const HeadDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetUserInfoCubi>()..fetchUserInfo(),
      child: _buildDrawerContent(context),
    );
  }

  Widget _buildDrawerContent(BuildContext context) {
    return BlocBuilder<GetUserInfoCubi, GetUserInfoState>(
      builder: (context, state) {
        return state.when(
            initial: () => Container(),
            error: (errorMsg) => Center(
                  child: Text("Error: $errorMsg"),
                ),
            loading: () => const CircularProgressIndicator(),
            success: (userModel) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 120.h,
                        width: 130.w,
                        child: MultiBlocProvider(
                          providers: [
                            BlocProvider(
                              create: (context) => getIt<PutImageCubit>(),
                            ),
                          ],
                          child: userModel.profilePictureUrl!.isEmpty
                              ? const PickImageWidget()
                              : ClipOval(
                                  child: Image.network(
                                      userModel.profilePictureUrl!),
                                ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        userModel.firstName + " " + userModel.lastName,
                        style: AppStyles.font20Black(context),
                      ),
                    ],
                  ),
                ));
      },
    );
  }
}
