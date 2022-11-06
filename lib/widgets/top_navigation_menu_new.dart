import 'package:single_page_scrollable_website/common/common.dart';
import 'package:flutter/material.dart';

import 'navigation_menu_button_new.dart';

class TopNavigationMenu2 extends StatelessWidget {
  final List<Widget> pages;
  final ValueNotifier<TheCode?> theCodeNotifier;

  const TopNavigationMenu2({
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
      builder: (BuildContext context, TheCode? value, Widget? child) {
        return Container(
          color: Colors.black87,
          child: Wrap(
            direction: Axis.horizontal,
            children: [
              //       for (int index = 0; index < colors.length; index++)
              //     NavigationMenuButton(
              //       color: colors[index],
              //       selected: colorCodeIndex == index,
              //       padding: const EdgeInsets.symmetric(
              //         horizontal: 8,
              //         vertical: 16,
              //       ),
              //       onPressed: () {
              //         theCodeNotifier.value = TheCode(
              //           theCode: colors[index].toHex(),
              //           source: TheCodeSelectionSource.fromButtonClick,
              //         );
              //       },
              //     ),
              NavigationMenuButtonNew(
                title: 'P0',
                selected: pageCodeIndex == 0,
                onPressed: () {
                  theCodeNotifier.value = TheCode(
                    theCode: pages[0].toString(),
                    source: TheCodeSelectionSource.fromButtonClick,
                  );
                },
              ),
              NavigationMenuButtonNew(
                title: 'P1',
                selected: pageCodeIndex == 1,
                onPressed: () {
                  theCodeNotifier.value = TheCode(
                    theCode: pages[1].toString().toLowerCase(),
                    source: TheCodeSelectionSource.fromButtonClick,
                  );
                },
              ),
              NavigationMenuButtonNew(
                title: 'P2',
                selected: pageCodeIndex == 2,
                onPressed: () {
                  theCodeNotifier.value = TheCode(
                    theCode: pages[2].toString().toLowerCase(),
                    source: TheCodeSelectionSource.fromButtonClick,
                  );
                },
              ),
              NavigationMenuButtonNew(
                title: 'P3',
                selected: pageCodeIndex == 3,
                onPressed: () {
                  theCodeNotifier.value = TheCode(
                    theCode: pages[3].toString().toLowerCase(),
                    source: TheCodeSelectionSource.fromButtonClick,
                  );
                },
              ),
              NavigationMenuButtonNew(
                title: 'P4',
                selected: pageCodeIndex == 4,
                onPressed: () {
                  theCodeNotifier.value = TheCode(
                    theCode: pages[4].toString().toLowerCase(),
                    source: TheCodeSelectionSource.fromButtonClick,
                  );
                },
              ),
              NavigationMenuButtonNew(
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
