import 'package:flutter/material.dart';
import 'package:single_page_scrollable_website/common/common.dart';

class ShapedButton extends StatelessWidget {
  final Color color;
  // final ShapeBorderType shapeBorderType;
  final VoidCallback? onPressed;
  final String? text;

  const ShapedButton({
    Key? key,
    required this.color,
    // required this.shapeBorderType,
    this.onPressed,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          // shape: shapeBorderType.getShapeBorder() as OutlinedBorder?,
        ),
        onPressed: onPressed ?? () {},
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ColoredText(
            color: color,
            // text: shapeBorderType.stringRepresentation(),
          ),
        ),
      ),
    );
  }
}
