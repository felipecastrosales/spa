import 'package:flutter/material.dart';

import 'package:single_page_scrollable_website/common/common.dart';
import 'package:single_page_scrollable_website/widgets/widgets.dart';

import 'code_sections.dart';

class HomeScreen extends StatelessWidget {
  final List<Widget> pages;
  final ValueNotifier<TheCode?> theCodeNotifier;

  const HomeScreen({
    Key? key,
    required this.pages,
    required this.theCodeNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          TopNavigationMenu(
            pages: pages,
            theCodeNotifier: theCodeNotifier,
          ),
          Expanded(
            child: CodeSections(
              pages: pages,
              theCodeNotifier: theCodeNotifier,
            ),
          ),
        ],
      ),
    );
  }
}
