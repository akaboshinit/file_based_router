import 'package:file_based_router_annotations/annotations.dart';
import 'package:flutter/material.dart';

import 'app.route.g.dart';

@fileAppRouter
final _routes = routes;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _routes,
    );
  }
}
