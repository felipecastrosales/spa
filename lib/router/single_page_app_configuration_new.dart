class SinglePageAppConfigurationNew {
  final String? colorCode;
  final bool unknown;

  SinglePageAppConfigurationNew.home({String? colorCode})
      : unknown = false,
        colorCode = colorCode;

  SinglePageAppConfigurationNew.shapeBorder(String? colorCode)
      : unknown = false,
        colorCode = colorCode;

  SinglePageAppConfigurationNew.unknown()
      : unknown = true,
        colorCode = null;

  bool get isUnknown => unknown == true;
  bool get isHomePage => unknown == false;
  bool get isShapePage => unknown == false && colorCode != null;
}
