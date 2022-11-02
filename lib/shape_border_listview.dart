import 'package:flutter/material.dart';
import 'package:single_page_scrollable_website/common/common.dart';
import 'package:single_page_scrollable_website/widgets/shaped_button.dart';

class ShapeBorderListView extends StatelessWidget {
  final ValueNotifier<ColorCode?> colorCodeNotifier;
  final MaterialColor sectionColor;

  const ShapeBorderListView({
    Key? key,
    required this.sectionColor,
    required this.colorCodeNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShapedButton(
          color: sectionColor,
          onPressed: () {
            colorCodeNotifier.value = ColorCode(
              hexColorCode: sectionColor.toHex(),
              source: ColorCodeSelectionSource.fromButtonClick,
            );
          },
        ),
      ],
    );
  }
}
