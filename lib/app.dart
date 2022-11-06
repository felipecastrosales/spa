import 'package:flutter/material.dart';

import 'pages/pages.dart';
import 'router/single_page_app_route_information_parser.dart';
import 'router/single_page_app_router_delegate.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late SinglePageAppRouterDelegate delegate;
  late SinglePageAppRouteInformationParser parser;
  final pages = const [Page0(), Page1(), Page2(), Page3(), Page4(), Page5()];

  @override
  void initState() {
    super.initState();
    delegate = SinglePageAppRouterDelegate(pages: pages);
    parser = SinglePageAppRouteInformationParser(pages: pages);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: delegate,
      routeInformationParser: parser,
    );
  }
}
