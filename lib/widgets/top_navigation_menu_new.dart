import 'package:single_page_scrollable_website/common/common.dart';
import 'package:flutter/material.dart';

import 'navigation_menu_button_new.dart';

class TopNavigationMenu2 extends StatelessWidget {
  final List<MaterialColor> colors;
  final ValueNotifier<TheCode?> theCodeNotifier;

  const TopNavigationMenu2({
    Key? key,
    required this.colors,
    required this.theCodeNotifier,
  }) : super(key: key);

  int get colorCodeIndex {
    final selectedTheCode = theCodeNotifier.value?.theCode;
    int index = colors.indexWhere(
      (element) => element.toHex() == selectedTheCode,
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
              // NavigationMenuButtonNew(
              //   color: Colors.purple,
              //   selected: colorCodeIndex == 0,
              //   onPressed: () {
              //     theCodeNotifier.value = TheCode(
              //       theCode: colors[10].toHex(),
              //       source: TheCodeSelectionSource.fromButtonClick,
              //     );
              //   },
              // ),
              for (int index = 0; index < colors.length; index++)
                NavigationMenuButtonNew(
                  color: colors[index],
                  selected: colorCodeIndex == index,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  onPressed: () {
                    theCodeNotifier.value = TheCode(
                      theCode: colors[index].toHex(),
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
