import 'package:file_based_router_annotations/file_based_router_annotations.dart';
import 'package:flutter/material.dart';

@fileRouter
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
