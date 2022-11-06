import 'package:flutter/material.dart';

class NavigationMenuButtonNew extends StatelessWidget {
  final String title;
  final bool selected;
  final EdgeInsets padding;
  final VoidCallback onPressed;

  const NavigationMenuButtonNew({
    Key? key,
    required this.title,
    required this.selected,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headline6;

    return Padding(
      padding: padding,
      child: selected
          ? ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                title,
                style: textTheme?.copyWith(color: Colors.white),
              ),
            )
          : TextButton(
              onPressed: onPressed,
              child: Text(
                title,
                style: textTheme?.copyWith(color: Colors.blue),
              ),
            ),
    );
  }
}