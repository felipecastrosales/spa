import 'package:flutter/material.dart';

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
  final _colors = Colors.primaries.reversed.toList();

  @override
  void initState() {
    super.initState();
    delegate = SinglePageAppRouterDelegate(colors: _colors);
    parser = SinglePageAppRouteInformationParser(colors: _colors);
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
