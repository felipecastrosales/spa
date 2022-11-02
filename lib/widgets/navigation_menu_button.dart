import 'package:flutter/material.dart';
import 'package:single_page_scrollable_website/common/common.dart';

class NavigationMenuButton extends StatelessWidget {
  final Color color;
  final bool selected;
  final EdgeInsets padding;
  final VoidCallback onPressed;

  const NavigationMenuButton({
    Key? key,
    required this.color,
    required this.selected,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headline6;
    Brightness brightness = ThemeData.estimateBrightnessForColor(color);
    Color textColor =
        brightness == Brightness.light ? Colors.black : Colors.white;

    return Padding(
      padding: padding,
      child: selected
          ? ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: color),
              // child: _text(context, textColor),
              child: Text(
                '#${color.toHex()}',
                style: textTheme?.copyWith(color: textColor),
              ),
            )
          : TextButton(
              onPressed: onPressed,
              // child: _text(context, color),
              child: Text(
                '#${color.toHex()}',
                style: textTheme?.copyWith(color: color),
              ),
            ),
    );
  }

  // Text _text(BuildContext context, Color? textColor) =>
  // Text('#${color.toHex()}',
  // style: Theme.of(context).textTheme.headline6?.copyWith(color: textColor,),);
}
