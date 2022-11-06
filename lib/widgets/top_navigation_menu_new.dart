import 'package:single_page_scrollable_website/common/common.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

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
              NavigationMenuButton(
                color: Colors.purple,
                selected: colorCodeIndex == 10,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                onPressed: () {},
              ),
              for (int index = 0; index < colors.length; index++)
                NavigationMenuButton(
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
