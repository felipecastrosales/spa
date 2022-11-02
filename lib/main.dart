import 'package:flutter/material.dart';
import 'package:single_page_scrollable_website/router/single_page_app_route_information_parser.dart';
import 'package:single_page_scrollable_website/router/single_page_app_router_delegate.dart';

import '/configs/configure_nonweb.dart'
    if (dart.library.html) '/configs/configure_web.dart';

void main() {
  configureApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
