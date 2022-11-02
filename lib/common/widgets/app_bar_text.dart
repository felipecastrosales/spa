import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  final Color appBarColor;
  final String text;

  const AppBarText({
    Key? key,
    required this.appBarColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Brightness brightness = ThemeData.estimateBrightnessForColor(appBarColor);
    Color textColor =
        brightness == Brightness.light ? Colors.black : Colors.white;
    return Text(
      text,
      style: Theme.of(context).textTheme.headline6?.copyWith(color: textColor),
    );
  }
}
