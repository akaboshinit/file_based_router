import 'package:example/pages/_home/home.dart';
import 'package:file_based_router_annotations/annotations.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _routes,
    );
  }
}

final _routes = <String, WidgetBuilder>{
  '/': (context) => const HomePage(),
};

@routeGenerator
final route = _routes['/'];
