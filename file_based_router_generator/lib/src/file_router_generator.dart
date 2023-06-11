import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:file_based_router_annotations/file_based_router_annotations.dart';
import 'package:source_gen/source_gen.dart';

class FileRouterGenerator extends GeneratorForAnnotation<FileRouter> {
  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    final LibraryElement library = await buildStep.inputLibrary;
    final import = library.identifier;

    final name = element.name;

    return '''

import '$import';

const hello = "world";
final className = "$name";
    ''';
  }
}
