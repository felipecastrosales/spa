class SinglePageAppConfiguration {
  final String? colorCode;
  // final ShapeBorderType? shapeBorderType;
  final bool unknown;

  SinglePageAppConfiguration.home({String? colorCode})
      : unknown = false,
        // shapeBorderType = null,
        colorCode = colorCode;

  SinglePageAppConfiguration.shapeBorder(
    String? colorCode,
    // ShapeBorderType? shape,
  )   : unknown = false,
        // shapeBorderType = shape,
        colorCode = colorCode;

  SinglePageAppConfiguration.unknown()
      : unknown = true,
        // shapeBorderType = null,
        colorCode = null;

  bool get isUnknown => unknown == true;

  // bool get isHomePage => unknown == false && shapeBorderType == null;
  bool get isHomePage => unknown == false;

  bool get isShapePage => unknown == false && colorCode != null;
  // unknown == false && colorCode != null && shapeBorderType != null;
}
