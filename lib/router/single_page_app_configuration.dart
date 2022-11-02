class SinglePageAppConfiguration {
  final String? colorCode;
  final bool unknown;

  SinglePageAppConfiguration.home({String? colorCode})
      : unknown = false,
        colorCode = colorCode;

  SinglePageAppConfiguration.shapeBorder(String? colorCode)
      : unknown = false,
        colorCode = colorCode;

  SinglePageAppConfiguration.unknown()
      : unknown = true,
        colorCode = null;

  bool get isUnknown => unknown == true;

  bool get isHomePage => unknown == false;

  bool get isShapePage => unknown == false && colorCode != null;
}
