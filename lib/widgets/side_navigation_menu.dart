import 'package:flutter/material.dart';
import 'package:single_page_scrollable_website/common/common.dart';

import 'widgets.dart';

class SideNavigationMenu extends StatelessWidget {
  final List<MaterialColor> colors;
  final ValueNotifier<ColorCode?> colorCodeNotifier;

  const SideNavigationMenu({
    Key? key,
    required this.colors,
    required this.colorCodeNotifier,
  }) : super(key: key);

  int get colorCodeIndex {
    int index = colors.indexWhere((element) {
      final hexColorCode = colorCodeNotifier.value?.hexColorCode;
      return element.toHex() == hexColorCode;
    });
    return index > -1 ? index : 0;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: colorCodeNotifier,
      builder: (BuildContext context, ColorCode? value, Widget? child) {
        return Container(
          color: Colors.black87,
          width: 200,
          child: ListView.builder(
            itemCount: colors.length,
            itemBuilder: (BuildContext context, int index) {
              final color = colors[index];
              return NavigationMenuButton(
                color: color,
                selected: colorCodeIndex == index,
                padding: const EdgeInsets.all(16),
                onPressed: () {
                  colorCodeNotifier.value = ColorCode(
                    hexColorCode: color.toHex(),
                    source: ColorCodeSelectionSource.fromButtonClick,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
