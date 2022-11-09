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
    final pathSegments = uri.pathSegments;
    debugPrint('''
      SinglePageAppRouteInformationParser.parseRouteInformation:
      pathSegments: $pathSegments | length: ${pathSegments.length}
    ''');
    if (uri.pathSegments.isEmpty) {
      return SinglePageAppConfiguration.home();
    } else if (uri.pathSegments.length == 2) {
      final first = pathSegments[0].toLowerCase();
      final second = pathSegments[1].toLowerCase();
      if (first == 'section' && isValidPage(second)) {
        return SinglePageAppConfiguration.home(pageCode: second);
      } else {
        return SinglePageAppConfiguration.unknown();
      }
    } else {
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
        location: configuration.pageCode == null
            ? '/'
            : '/section/${configuration.pageCode}',
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
