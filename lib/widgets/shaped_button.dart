/*
 * Copyright 2020 Cagatay Ulusoy (Ulus Oy Apps). All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import 'package:single_page_scrollable_website/common/common.dart';
import 'package:flutter/material.dart';

class ShapedButton extends StatelessWidget {
  final Color color;
  final ShapeBorderType shapeBorderType;
  final VoidCallback? onPressed;
  final String? text;

  const ShapedButton({
    Key? key,
    required this.color,
    required this.shapeBorderType,
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
          shape: shapeBorderType.getShapeBorder() as OutlinedBorder?,
        ),
        onPressed: onPressed ?? () {},
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ColoredText(
            color: color,
            text: shapeBorderType.stringRepresentation(),
          ),
        ),
      ),
    );
  }
}
