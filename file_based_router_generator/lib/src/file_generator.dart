import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:file_based_router_annotations/file_based_router_annotations.dart';
import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';
import 'package:source_gen/source_gen.dart';

final dartFile = Glob("**/pages/**.dart");

class FileGenerator extends GeneratorForAnnotation<RouteGenerator> {
  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    final files = dartFile.listSync();

    return '''
const hello = "world";
// const files = $files;
    ''';
  }
}
