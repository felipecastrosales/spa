import 'package:flutter/material.dart';

import 'package:single_page_scrollable_website/router/router.dart';

class SinglePageAppRouteInformationParser
    extends RouteInformationParser<SinglePageAppConfiguration> {
  SinglePageAppRouteInformationParser({
    required this.pages,
  });

  final List<Widget> pages;

  @override
  Future<SinglePageAppConfiguration> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = Uri.parse(routeInformation.location ?? '');
    debugPrint('''
      SinglePageAppRouteInformationParser.parseRouteInformation:
      uri.pathSegments: ${uri.pathSegments}',
      uri.pathSegments.length: ${uri.pathSegments.length}
      ''');
    if (uri.pathSegments.isEmpty) {
      return SinglePageAppConfiguration.home();
      // analyze
    } else if (uri.pathSegments.length == 1 &&
        isValidPage(uri.pathSegments.first)) {
      return SinglePageAppConfiguration.home();
    } else if (uri.pathSegments.length == 2) {
      final first = uri.pathSegments[0].toLowerCase();
      final second = uri.pathSegments[1].toLowerCase();
      if (first == '/' && isValidPage(second)) {
        debugPrint('sections ok and is valid page :)');
        return SinglePageAppConfiguration.home(pageCode: second);
      } else {
        debugPrint('sections ok but is not valid page :(');
        return SinglePageAppConfiguration.unknown();
      }
    } else {
      debugPrint('unknown 30');
      return SinglePageAppConfiguration.unknown();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(
    SinglePageAppConfiguration configuration,
  ) {
    if (configuration.isUnknown) {
      debugPrint('unknown page');
      return const RouteInformation(location: '/unknown');
    } else if (configuration.isHomePage) {
      return RouteInformation(
        location:
            configuration.pageCode == null ? '/' : '/${configuration.pageCode}',
      );
    } else {
      return null;
    }
  }

  bool isValidPage(String pageCode) {
    final List<String> pagesCodes = pages.map((page) {
      return page.toString().toLowerCase();
    }).toList();
    return pagesCodes.contains(pageCode);
  }
}
