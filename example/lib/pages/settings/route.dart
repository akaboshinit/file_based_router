import 'package:file_based_router_annotations/file_based_router_annotations.dart';
import 'package:flutter/material.dart';

@fileRoute
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('SettingsPage Hello World!'),
      ),
    );
  }
}
