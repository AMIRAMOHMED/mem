import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem/core/di/injection_container.dart';
import 'package:mem/core/extension/num_extension.dart';
import 'package:mem/core/service/shared_pref/pref_keys.dart';
import 'package:mem/core/service/shared_pref/shared_pref.dart';
import 'package:mem/core/themes/app_style.dart';
import 'package:mem/features/home/logic/put%20image%20cubit/put_image_cubit.dart';
import 'package:mem/features/home/ui/widgets/Drawer/pick_image_widget.dart';

class HeadDrawer extends StatelessWidget {
  final String name;
  final String? photo;

  const HeadDrawer({Key? key, required this.name, this.photo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 120.h,
            width: 130.w,
            child: BlocProvider(
              create: (context) => getIt<PutImageCubit>(),
              child: photo == null
                  ? const PickImageWidget()
                  : ClipOval(
                      child: Image.network(
                      photo!,
                      fit: BoxFit.cover,
                    )),
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
