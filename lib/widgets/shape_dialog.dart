// import 'package:flutter/material.dart';

// import 'package:single_page_scrollable_website/common/common.dart';
// import 'package:single_page_scrollable_website/widgets/app_bar_back_button.dart';

// class ShapeDialog extends StatelessWidget {
//   final String colorCode;
//   // final ShapeBorderType shapeBorderType;

//   const ShapeDialog({
//     Key? key,
//     required this.colorCode,
//     // required this.shapeBorderType,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // var borderType = shapeBorderType.stringRepresentation().toUpperCase();
//     return Center(
//       child: Container(
//         width: 400,
//         height: 250,
//         color: Colors.white,
//         child: Column(
//           children: [
//             _bar(),
//             // _bar(borderType),
//             // Expanded(
//             //   // child: _button(context, borderType),
//             //   child: _button(context),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Padding _button(
//   //   BuildContext context,
//   //   // String borderType,
//   // ) {
//   //   return Padding(
//   //     padding: const EdgeInsets.all(32.0),
//   //     child: FittedBox(
//   //       child: ShapedButton(
//   //         color: colorCode.hexToColor(),
//   //         // shapeBorderType: shapeBorderType,
//   //         onPressed: () => debugPrint("Submit clicked"),
//   //       ),
//   //     ),
//   //   );
//   // }

//   AppBar _bar(
//       // String borderType,
//       ) {
//     final color = colorCode.hexToColor();
//     return AppBar(
//       title: AppBarText(
//         appBarColor: color,
//         text: colorCode,
//         // text: '$borderType #$colorCode',
//       ),
//       leading: AppBarBackButton(color: color),
//       backgroundColor: color,
//     );
//   }
// }
