import 'package:flutter/material.dart';

import 'pages/pages.dart';
import 'router/single_page_app_route_information_parser_new.dart';
import 'router/single_page_app_router_delegate_new.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late SinglePageAppRouterDelegateNew delegate;
  late SinglePageAppRouteInformationParserNew parser;
  final pages = const [Page1(), Page2(), Page3(), Page4(), Page5()];

  @override
  void initState() {
    super.initState();
    delegate = SinglePageAppRouterDelegateNew(pages: pages);
    parser = SinglePageAppRouteInformationParserNew(pages: pages);
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
