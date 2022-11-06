class SinglePageAppConfigurationNew {
  final String? pageCode;
  final bool unknown;

  SinglePageAppConfigurationNew.home({String? pageCode})
      : unknown = false,
        pageCode = pageCode;

  SinglePageAppConfigurationNew.shapeBorder(String? pageCode)
      : unknown = false,
        pageCode = pageCode;

  SinglePageAppConfigurationNew.unknown()
      : unknown = true,
        pageCode = null;

  bool get isUnknown => unknown == true;
  bool get isHomePage => unknown == false;
  bool get isShapePage => unknown == false && pageCode != null;
}
