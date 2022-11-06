import 'package:flutter/material.dart';
import 'package:single_page_scrollable_website/common/extensions/color_extensions.dart';
import 'package:single_page_scrollable_website/common/entity/entity.dart';

class CodeSections extends StatefulWidget {
  final List<MaterialColor> colors;
  final ValueNotifier<TheCode?> theCodeNotifier;

  const CodeSections({
    Key? key,
    required this.colors,
    required this.theCodeNotifier,
  }) : super(key: key);

  @override
  State<CodeSections> createState() => _CodeSectionsState();
}

class _CodeSectionsState extends State<CodeSections> {
  final double _minPageHeight = 600;
  PageController _pageController = PageController();

  // Find the index of the color code from the colors list
  int get _colorCodeIndex {
    final hexColorCode = widget.theCodeNotifier.value?.theCode;
    // final hexColorCode = widget.colorCodeNotifier.value?.hexColorCode;
    int index = widget.colors.indexWhere((element) {
      return element.toHex() == hexColorCode;
    });
    return index > -1 ? index : 0;
  }

  @override
  void initState() {
    super.initState();
    widget.theCodeNotifier.addListener(() {
      final fromScroll = widget.theCodeNotifier.value?.source ==
          ColorCodeSelectionSource.fromScroll;
      if (_pageController.hasClients && !fromScroll) {
        _pageController.animateToPage(
          _colorCodeIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final availableHeight = constraints.maxHeight;
        _updatePageController(availableHeight);
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is UserScrollNotification) {
              _onUserScroll();
            }
            return true;
          },
          child: PageView.builder(
            pageSnapping: false,
            scrollDirection: Axis.vertical,
            controller: _pageController,
            itemCount: widget.colors.length,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final color = widget.colors[index];
              return Container(
                color: color,
              );
            },
          ),
        );
      },
    );
  }

  void _updatePageController(double availableHeight) {
    if (availableHeight < _minPageHeight) {
      _pageController = PageController(
        viewportFraction: _minPageHeight / availableHeight,
        initialPage: _colorCodeIndex,
      );
    } else {
      _pageController = PageController(
        viewportFraction: 1,
        initialPage: _colorCodeIndex,
      );
    }
  }

  void _onUserScroll() {
    final pageIndex = _pageController.page?.floor() ?? 0;
    final hexColorCode = widget.colors[pageIndex].toHex();
    widget.theCodeNotifier.value = TheCode(
      theCode: hexColorCode,
      source: TheCodeSelectionSource.fromScroll,
    );
  }
}
