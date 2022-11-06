import 'package:flutter/material.dart';
import 'package:single_page_scrollable_website/common/entity/entity.dart';

class CodeSections extends StatefulWidget {
  final List<Widget> pages;
  final ValueNotifier<TheCode?> theCodeNotifier;

  const CodeSections({
    Key? key,
    required this.pages,
    required this.theCodeNotifier,
  }) : super(key: key);

  @override
  State<CodeSections> createState() => _CodeSectionsState();
}

class _CodeSectionsState extends State<CodeSections> {
  final double _minPageHeight = 400;
  PageController _pageController = PageController();

  int get _buildPagesIndex {
    final pageCode = widget.theCodeNotifier.value?.theCode;
    int index = widget.pages.indexWhere((page) {
      return page.toString().toLowerCase() == pageCode;
    });
    return index > -1 ? index : 0;
  }

  @override
  void initState() {
    super.initState();
    widget.theCodeNotifier.addListener(() {
      final fromScroll = widget.theCodeNotifier.value?.source ==
          TheCodeSelectionSource.fromScroll;
      if (_pageController.hasClients && !fromScroll) {
        _pageController.animateToPage(
          _buildPagesIndex,
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
            itemCount: widget.pages.length,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return widget.pages[index];
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
        initialPage: _buildPagesIndex,
      );
    } else {
      _pageController = PageController(
        viewportFraction: 1,
        initialPage: _buildPagesIndex,
      );
    }
  }

  void _onUserScroll() {
    final pageIndex = _pageController.page?.floor() ?? 0;
    final pageCode = widget.pages[pageIndex].toString().toLowerCase();
    widget.theCodeNotifier.value = TheCode(
      theCode: pageCode,
      source: TheCodeSelectionSource.fromScroll,
    );
  }
}
