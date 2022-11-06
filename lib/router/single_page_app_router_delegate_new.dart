import 'package:flutter/material.dart';
import 'package:single_page_scrollable_website/home_screen_new.dart';
import 'package:single_page_scrollable_website/widgets/unknown_screen.dart';
import 'package:single_page_scrollable_website/common/common.dart';

import 'single_page_app_configuration_new.dart';

class SinglePageAppRouterDelegateNew
    extends RouterDelegate<SinglePageAppConfigurationNew>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<SinglePageAppConfigurationNew> {
  late Page _homePage;
  final List<Widget> pages;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  final ValueNotifier<TheCode?> _theCodeNotifier = ValueNotifier(null);
  final ValueNotifier<bool?> _unknownStateNotifier = ValueNotifier(null);

  String get defaultPage => pages.first.toString();

  SinglePageAppRouterDelegateNew({
    required this.pages,
  }) {
    _homePage = MaterialPage(
      key: const ValueKey<String>('HomeScreen'),
      child: HomeScreenNew(
        pages: pages,
        theCodeNotifier: _theCodeNotifier,
      ),
    );
    Listenable.merge([
      _unknownStateNotifier,
      _theCodeNotifier,
    ]).addListener(() {
      debugPrint('notifying the router widget');
      notifyListeners();
    });
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  SinglePageAppConfigurationNew get currentConfiguration {
    if (_unknownStateNotifier.value == true) {
      return SinglePageAppConfigurationNew.unknown();
    } else {
      return SinglePageAppConfigurationNew.home(
        pageCode: _theCodeNotifier.value?.theCode,
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
                key: ValueKey<String>('UnknownScreen'),
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
  Future<void> setNewRoutePath(
    SinglePageAppConfigurationNew configuration,
  ) async {
    if (configuration.unknown) {
      _unknownStateNotifier.value = true;
      _theCodeNotifier.value = null;
    } else {
      _unknownStateNotifier.value = false;
      _theCodeNotifier.value = TheCode(
        theCode: configuration.pageCode ?? defaultPage,
        source: TheCodeSelectionSource.fromBrowserAddressBar,
      );
    }
  }
}
