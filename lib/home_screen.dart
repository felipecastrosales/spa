import 'package:flutter/material.dart';

import 'package:single_page_scrollable_website/color_sections.dart';
import 'package:single_page_scrollable_website/common/common.dart';
import 'package:single_page_scrollable_website/widgets/top_navigation_menu.dart';

import 'widgets/new_top.dart';

class HomeScreen extends StatelessWidget {
  final List<MaterialColor> colors;
  final ValueNotifier<ColorCode?> colorCodeNotifier;
  final ValueNotifier<TheCode?> theCodeNotifier;

  const HomeScreen({
    Key? key,
    required this.colors,
    required this.colorCodeNotifier,
    required this.theCodeNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          TopNavigationMenu2(
            colors: colors,
            theCodeNotifier: theCodeNotifier,
          ),
          TopNavigationMenu(
            colors: colors,
            colorCodeNotifier: colorCodeNotifier,
          ),
          Expanded(
            child: ColorSections(
              colors: colors,
              colorCodeNotifier: colorCodeNotifier,
            ),
          ),
        ],
      ),
    );
  }
}
