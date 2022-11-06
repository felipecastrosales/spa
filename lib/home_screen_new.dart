import 'package:flutter/material.dart';

import 'package:single_page_scrollable_website/common/common.dart';
import 'package:single_page_scrollable_website/widgets/widgets.dart';

import 'code_sections_new.dart';

class HomeScreenNew extends StatelessWidget {
  final List<Widget> pages;

  final ValueNotifier<TheCode?> theCodeNotifier;
  // final List<Widget> sections;

  const HomeScreenNew({
    Key? key,
    required this.pages,

    // required this.sections,
    required this.theCodeNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          TopNavigationMenu2(
            pages: pages,
            theCodeNotifier: theCodeNotifier,
          ),
          Expanded(
            child: CodeSectionsNew(
              theCodeNotifier: theCodeNotifier,
            ),
          ),
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
