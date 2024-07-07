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
    final uri = routeInformation.uri;
    final pathSegments = uri.pathSegments;
    debugPrint('''
      SinglePageAppRouteInformationParser.parseRouteInformation:
      pathSegments: $pathSegments | length: ${pathSegments.length}
    ''');
    if (pathSegments.isEmpty) {
      return SinglePageAppConfiguration.home();
    } else if (pathSegments.length == 2) {
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
    debugPrint('configuration: ${configuration.pageCode}');
    if (configuration.isUnknown) {
      debugPrint('unknown page');
      return RouteInformation(uri: Uri.parse('/unknown'));
    } else if (configuration.isHomePage) {
      return RouteInformation(
        uri: Uri.parse(configuration.pageCode == null
            ? '/'
            : '/section/${configuration.pageCode}'),
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
