import 'package:flutter/cupertino.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/features/collaboration/presentation/widgets/custom_container.dart';

class JoinButton extends StatelessWidget {
  const JoinButton({super.key, required this.onTap});
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(onTap:onTap ,
                child: const CustomContainer(
                  height: 80,
                  width: 200,
                  widget: Text(
                    "انضم الى الموعد",
                    style: TextStyle(color: AppPallete.black, fontSize: 25),
                  ),
                ),
              );
  }
}