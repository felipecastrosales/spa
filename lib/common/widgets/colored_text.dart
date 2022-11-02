import 'package:flutter/material.dart';
import 'package:single_page_scrollable_website/common/common.dart';

class ColoredText extends StatelessWidget {
  final Color color;
  final String? text;

  const ColoredText({
    Key? key,
    required this.color,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Brightness brightness = ThemeData.estimateBrightnessForColor(color);
    Color textColor =
        brightness == Brightness.light ? Colors.black : Colors.white;
    return Text(
      text == null ? "#${color.toHex()}" : text!,
      style: Theme.of(context).textTheme.headline6!.copyWith(color: textColor),
    );
  }
}
