import 'package:flutter/material.dart';

import '/configs/configure_nonweb.dart'
    if (dart.library.html) '/configs/configure_web.dart';

import 'app.dart';

void main() {
  configureApp();
  runApp(const App());
}
