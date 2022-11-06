class SinglePageAppConfigurationNew {
  final String? pageCode;
  final bool unknown;

  bool get isUnknown => unknown == true;
  bool get isHomePage => unknown == false;

  SinglePageAppConfigurationNew.home({String? pageCode})
      : unknown = false,
        pageCode = pageCode;

  SinglePageAppConfigurationNew.unknown()
      : unknown = true,
        pageCode = null;
}
