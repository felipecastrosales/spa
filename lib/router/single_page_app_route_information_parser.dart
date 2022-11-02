import 'package:flutter/material.dart';
import 'package:single_page_scrollable_website/common/common.dart';
import 'package:single_page_scrollable_website/router/single_page_app_configuration.dart';

class SinglePageAppRouteInformationParser
    extends RouteInformationParser<SinglePageAppConfiguration> {
  final List<MaterialColor> colors;

  SinglePageAppRouteInformationParser({required this.colors});

  @override
  Future<SinglePageAppConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.isEmpty) {
      return SinglePageAppConfiguration.home();
    } else if (uri.pathSegments.length == 2) {
      final first = uri.pathSegments[0].toLowerCase();
      final second = uri.pathSegments[1].toLowerCase();
      if (first == 'colors' && _isValidColor(second)) {
        return SinglePageAppConfiguration.home(colorCode: second);
      } else {
        return SinglePageAppConfiguration.unknown();
      }
    } else if (uri.pathSegments.length == 3) {
      final first = uri.pathSegments[0].toLowerCase();
      final second = uri.pathSegments[1].toLowerCase();
      // final third = uri.pathSegments[2].toLowerCase();
      // final shapeBorderType = extractShapeBorderType(third);
      // if (first == 'colors' && shapeBorderType != null) {
      if (first == 'colors') {
        return SinglePageAppConfiguration.shapeBorder(
          second,
          // shapeBorderType,
        );
      } else {
        return SinglePageAppConfiguration.unknown();
      }
    } else {
      return SinglePageAppConfiguration.unknown();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(
      SinglePageAppConfiguration configuration) {
    if (configuration.isUnknown) {
      return const RouteInformation(location: '/unknown');
    } else if (configuration.isHomePage) {
      return RouteInformation(
        location: configuration.colorCode == null
            ? '/'
            : '/colors/${configuration.colorCode}',
      );
    } else if (configuration.isShapePage) {
      // final borderType = configuration.shapeBorderType?.stringRepresentation();
      // final location = '/colors/${configuration.colorCode}/$borderType';
      final location = '/colors/${configuration.colorCode}';
      return RouteInformation(location: location);
    } else {
      return null;
    }
  }

  bool _isValidColor(String colorCode) {
    final List<String> colorCodes = colors.map((e) {
      return e.toHex();
    }).toList();
    return colorCodes.contains(colorCode);
  }

  // ShapeBorderType? extractShapeBorderType(String shapeBorderTypeValue) {
  //   final value = shapeBorderTypeValue.toLowerCase();
  //   switch (value) {
  //     case CONTINUOUS_SHAPE:
  //       return ShapeBorderType.CONTINUOUS;
  //     case BEVELED_SHAPE:
  //       return ShapeBorderType.BEVELED;
  //     case ROUNDED_SHAPE:
  //       return ShapeBorderType.ROUNDED;
  //     case STADIUM_SHAPE:
  //       return ShapeBorderType.STADIUM;
  //     case CIRCLE_SHAPE:
  //       return ShapeBorderType.CIRCLE;
  //     default:
  //       return null;
  //   }
  // }
}
