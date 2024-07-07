import 'package:flutter/material.dart';

import 'package:single_page_scrollable_website/common/common.dart';

import 'code_sections.dart';
import 'widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.pages,
    required this.theCodeNotifier,
  });

  final List<Widget> pages;
  final ValueNotifier<TheCode?> theCodeNotifier;

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
