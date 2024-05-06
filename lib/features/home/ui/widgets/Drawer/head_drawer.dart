import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem/core/di/injection_container.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/features/home/logic/cubit/put_image_cubit.dart';
import 'package:mem/features/home/ui/widgets/Drawer/pick_image_widget.dart';

class HeadDrawer extends StatelessWidget {
  final String name;

  const HeadDrawer({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(100),
          //   child: Image.asset(
          //     Assets.profileLogo,
          //     width: 100.h,
          //     height: 100.h,
          //   ),
          // ),
          SizedBox(
            height: 120.h,
            width: 130.w,
            child: BlocProvider(
              create: (context) =>  getIt<PutImageCubit>(),
              child: const PickImageWidget(),
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            name,
            style: AppStyles.font20Black(context),
          ),
        ],
      ),
    );
  }
}
