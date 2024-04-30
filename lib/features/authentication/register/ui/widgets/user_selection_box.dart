import 'package:flutter/material.dart';
import 'package:mem/core/themes/app_pallete.dart';
import 'package:mem/core/themes/app_style.dart';

class UserSelectionBox extends StatefulWidget {
  const UserSelectionBox({
    super.key,
    required this.onSelectionChanged,
  });
  final Function(String) onSelectionChanged;

  @override
  State<UserSelectionBox> createState() => _UserSelectionBoxState();
}


class _UserSelectionBoxState extends State<UserSelectionBox> {
  String? currentOption;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: ListTile(
            title: Text(
              "متلعثم",
              style: AppStyles.font16LightGray(context),
            ),
            leading: SizedBox(
              width: 50,
              child: Radio(
                value: "stutterer",
                groupValue: currentOption,
                onChanged: (value) {
                  setState(
                    () {
                      currentOption = value.toString();

                      widget.onSelectionChanged(currentOption!);
                    },
                  );
                },
                activeColor: AppPallete.blue,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text(
              "ذو صلة",
              style: AppStyles.font16LightGray(context),
            ),
            leading: SizedBox(
              width: 50,
              child: Radio(
                activeColor: AppPallete.blue,
                value: "related",
                groupValue: currentOption,
                onChanged: (value) {
                  setState(() {
                    currentOption = value.toString();
                    widget.onSelectionChanged(currentOption!);
                  });
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
