import 'package:flutter/material.dart';
import 'package:single_page_scrollable_website/router/single_page_app_configuration_new.dart';

class SinglePageAppRouteInformationParserNew
    extends RouteInformationParser<SinglePageAppConfigurationNew> {
  SinglePageAppRouteInformationParserNew({
    required this.pages,
  });

  final List<Widget> pages;

  @override
  Future<SinglePageAppConfigurationNew> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = Uri.parse(routeInformation.location ?? '');
    if (uri.pathSegments.isEmpty) {
      return SinglePageAppConfigurationNew.home();
    } else if (uri.pathSegments.length == 2) {
      final first = uri.pathSegments[0].toLowerCase();
      final second = uri.pathSegments[1].toLowerCase();
      if (first == 'section' && _isValidPage(second)) {
        debugPrint('section ok');
        return SinglePageAppConfigurationNew.home(pageCode: second);
      } else {
        debugPrint('26 ! first');
        return SinglePageAppConfigurationNew.unknown();
      }
    } else {
      debugPrint('unknown 30');
      return SinglePageAppConfigurationNew.unknown();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(
    SinglePageAppConfigurationNew configuration,
  ) {
    if (configuration.isUnknown) {
      debugPrint('unknown page');
      return const RouteInformation(location: '/unknown');
    } else if (configuration.isHomePage) {
      return RouteInformation(
        location:
            configuration.pageCode == null ? '/' : '/${configuration.pageCode}',
      );
    } else if (configuration.isShapePage) {
      final location = '/${configuration.pageCode}';
      return RouteInformation(location: location);
    } else {
      return null;
    }
  }

  bool _isValidPage(String pageCode) {
    final List<String> pagesCodes = pages.map((element) {
      final page = element as MaterialPage;
      return page.key.toString();
    }).toList();
    return pagesCodes.contains(pageCode);
  }
}
