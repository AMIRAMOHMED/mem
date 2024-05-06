// import 'package:flutter/material.dart';
// import 'package:mem/core/extension/num_extension.dart';
// import 'package:mem/core/service/shared_pref/pref_keys.dart';
// import 'package:mem/core/service/shared_pref/shared_pref.dart';
// import 'package:mem/core/themes/app_pallete.dart';
// import 'package:mem/features/home/presentation/widgets/home/group_item.dart';

// class BuildGroupsList extends StatelessWidget {
//    BuildGroupsList({

//     super.key,
//     required this.onGroupItemTap,
//   });       final SharedPref _sharedPref = SharedPref();


//   final void Function() onGroupItemTap;
  

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height:  _sharedPref.getString(PrefKeys.type)== "STUTTERER"?120.0.h:300.h,
//       child: ListView.builder(
//         scrollDirection:  _sharedPref.getString(PrefKeys.type)== "STUTTERER"? Axis.horizontal:Axis.vertical,
//         physics: const BouncingScrollPhysics(),
//         itemCount: items.length,
//         itemBuilder: (context, index) =>
//             GestureDetector(onTap: onGroupItemTap, child: items[index]),
//       ),
//     );
//   }

//   static final List<GroupItem> items = [
//     const GroupItem(
//       text: 'Group Name',
//       color: AppPallete.lightMintGreen,
//     ),
//     const GroupItem(
//       text: 'Group Name',
//       color: AppPallete.pinkColor,
//     )
//   ];
// }
