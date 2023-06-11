import 'package:build/build.dart';
import 'package:file_based_router_generator/src/file_generator.dart';
import 'package:file_based_router_generator/src/file_router_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder fileRouterBuilder(BuilderOptions options) => LibraryBuilder(
      FileRouterGenerator(),
      generatedExtension: '.fr.g.dart',
      header: '''
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element
    ''',
      options: options,
    );

Builder fileBuilder(BuilderOptions options) =>
    SharedPartBuilder([FileGenerator()], "route.dart");
