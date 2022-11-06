import 'package:single_page_scrollable_website/common/common.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class TopNavigationMenu extends StatelessWidget {
  final List<Widget> pages;
  final ValueNotifier<TheCode?> theCodeNotifier;

  const TopNavigationMenu({
    Key? key,
    required this.pages,
    required this.theCodeNotifier,
  }) : super(key: key);

  int get pageCodeIndex {
    final selectedTheCode = theCodeNotifier.value?.theCode;
    int index = pages.indexWhere(
      (element) => element.toString().toLowerCase() == selectedTheCode,
    );
    return index > -1 ? index : 0;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: theCodeNotifier,
      builder: (context, value, child) {
        return Container(
          color: Colors.black87,
          child: Wrap(
            direction: Axis.horizontal,
            children: [
              NavigationMenuButton(
                title: 'P0',
                selected: pageCodeIndex == 0,
                onPressed: () {
                  theCodeNotifier.value = TheCode(
                    theCode: pages[0].toString().toLowerCase(),
                    source: TheCodeSelectionSource.fromButtonClick,
                  );
                },
              ),
              NavigationMenuButton(
                title: 'P1',
                selected: pageCodeIndex == 1,
                onPressed: () {
                  theCodeNotifier.value = TheCode(
                    theCode: pages[1].toString().toLowerCase(),
                    source: TheCodeSelectionSource.fromButtonClick,
                  );
                },
              ),
              NavigationMenuButton(
                title: 'P2',
                selected: pageCodeIndex == 2,
                onPressed: () {
                  theCodeNotifier.value = TheCode(
                    theCode: pages[2].toString().toLowerCase(),
                    source: TheCodeSelectionSource.fromButtonClick,
                  );
                },
              ),
              NavigationMenuButton(
                title: 'P3',
                selected: pageCodeIndex == 3,
                onPressed: () {
                  theCodeNotifier.value = TheCode(
                    theCode: pages[3].toString().toLowerCase(),
                    source: TheCodeSelectionSource.fromButtonClick,
                  );
                },
              ),
              NavigationMenuButton(
                title: 'P4',
                selected: pageCodeIndex == 4,
                onPressed: () {
                  theCodeNotifier.value = TheCode(
                    theCode: pages[4].toString().toLowerCase(),
                    source: TheCodeSelectionSource.fromButtonClick,
                  );
                },
              ),
              NavigationMenuButton(
                title: 'P5',
                selected: pageCodeIndex == 5,
                onPressed: () {
                  theCodeNotifier.value = TheCode(
                    theCode: pages[5].toString().toLowerCase(),
                    source: TheCodeSelectionSource.fromButtonClick,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
