class SinglePageAppConfiguration {
  final String? pageCode;
  final bool unknown;

  bool get isUnknown => unknown == true;
  bool get isHomePage => unknown == false;

  SinglePageAppConfiguration.home({String? pageCode})
      : unknown = false,
        pageCode = pageCode;

  SinglePageAppConfiguration.unknown()
      : unknown = true,
        pageCode = null;
}
