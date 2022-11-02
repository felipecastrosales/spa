import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:single_page_scrollable_website/common/common.dart';

class AppBarBackButton extends StatelessWidget {
  final Color color;

  const AppBarBackButton({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? const SizedBox.shrink()
        : BackButton(color: color.onTextColor());
  }
}
