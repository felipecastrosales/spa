import 'package:flutter/material.dart';
import 'package:single_page_scrollable_website/home_screen.dart';
import 'package:single_page_scrollable_website/widgets/unknown_screen.dart';
import 'package:single_page_scrollable_website/common/common.dart';

import 'single_page_app_configuration.dart';

class SinglePageAppRouterDelegate
    extends RouterDelegate<SinglePageAppConfiguration>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<SinglePageAppConfiguration> {
  late Page _homePage;
  final List<MaterialColor> colors;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  // App state fields
  final ValueNotifier<ColorCode?> _colorCodeNotifier = ValueNotifier(null);
  final ValueNotifier<TheCode?> _theCodeNotifier = ValueNotifier(null);
  final ValueNotifier<bool?> _unknownStateNotifier = ValueNotifier(null);

  String get defaultColorCode => colors.first.toHex();

  SinglePageAppRouterDelegate({required this.colors}) {
    _homePage = MaterialPage(
      key: const ValueKey<String>('HomePage'),
      child: HomeScreen(
        colors: colors,
        colorCodeNotifier: _colorCodeNotifier,
        theCodeNotifier: _theCodeNotifier,
      ),
    );
    Listenable.merge([
      _unknownStateNotifier,
      _colorCodeNotifier,
      _theCodeNotifier,
    ]).addListener(() {
      debugPrint('notifying the router widget');
      notifyListeners();
    });
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  SinglePageAppConfiguration get currentConfiguration {
    if (_unknownStateNotifier.value == true) {
      return SinglePageAppConfiguration.unknown();
    } else {
      return SinglePageAppConfiguration.home(
        colorCode: _colorCodeNotifier.value?.hexColorCode,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: _unknownStateNotifier.value == true
          ? [
              const MaterialPage(
                key: ValueKey<String>('Unknown'),
                child: UnknownScreen(),
              ),
            ]
          : [_homePage],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(SinglePageAppConfiguration configuration) async {
    if (configuration.unknown) {
      _unknownStateNotifier.value = true;
      _colorCodeNotifier.value = null;
    } else if (configuration.isHomePage) {
      _unknownStateNotifier.value = false;
      _colorCodeNotifier.value = ColorCode(
        hexColorCode: configuration.colorCode ?? defaultColorCode,
        source: ColorCodeSelectionSource.fromBrowserAddressBar,
      );
    } else if (configuration.isShapePage) {
      _unknownStateNotifier.value = false;
      _colorCodeNotifier.value = ColorCode(
        hexColorCode: configuration.colorCode ?? defaultColorCode,
        source: ColorCodeSelectionSource.fromBrowserAddressBar,
      );
    }
  }
}
