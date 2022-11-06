import 'package:flutter/material.dart';

import 'package:single_page_scrollable_website/common/common.dart';

class HomeScreen extends StatelessWidget {
  final List<MaterialColor> colors;

  final ValueNotifier<TheCode?> theCodeNotifier;
  // final List<Widget> sections;

  const HomeScreen({
    Key? key,
    required this.colors,

    // required this.sections,
    required this.theCodeNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: const [
          // TopNavigationMenu2(
          //   colors: colors,
          //   theCodeNotifier: theCodeNotifier,
          // ),
          // Expanded(
          //   child: CodeSectionsNew(
          //     theCodeNotifier: theCodeNotifier,
          //   ),
          // ),
          // Expanded(
          //   child: CodeSections(
          //     colors: colors,
          //     theCodeNotifier: theCodeNotifier,
          //   ),
          // ),
          // TopNavigationMenu(
          //   colors: colors,
          //   colorCodeNotifier: colorCodeNotifier,
          // ),
          // Expanded(
          //   child: ColorSections(
          //     colors: colors,
          //     colorCodeNotifier: colorCodeNotifier,
          //   ),
          // ),
        ],
      ),
    );
  }
}
