import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:file_based_router_annotations/file_based_router_annotations.dart';
import 'package:glob/glob.dart';
import 'package:source_gen/source_gen.dart';

class FileRouterGenerator extends GeneratorForAnnotation<FileAppRouter> {
  TypeChecker get _fileRouteTypeChecker =>
      const TypeChecker.fromRuntime(FileRoute);

  final _regExp = RegExp(r"^pages/(?<routePath>.+)/route.dart$");

  @override
  FutureOr<String> generateForAnnotatedElement(
      element, annotation, buildStep) async {
    final assets = buildStep.findAssets(Glob("**/pages/**route.dart"));

    final imports = <String>[];
    final routePaths = <String, String>{};

    await for (final asset in assets) {
      if (!await buildStep.resolver.isLibrary(asset)) {
        continue;
      }

      final lib = LibraryReader(
        await buildStep.resolver.libraryFor(
          asset,
          allowSyntaxErrors: false,
        ),
      );
      for (final annotatedElement
          in lib.annotatedWith(_fileRouteTypeChecker)) {
        final element = annotatedElement.element;
        if (element is! ClassElement) {
          continue;
        }

        final path = asset.path.replaceFirst("lib/", "");

        final matchedRoute = _regExp.firstMatch(path);
        final routePath = matchedRoute?.namedGroup("routePath") ?? "";

        final import = "import 'package:${asset.package}/$path';";
        final widgetName = "${element.name}()";

        imports.add(import);
        routePaths[routePath] = widgetName;
      }
    }

    return '''
import 'package:flutter/material.dart';
${imports.join("\n")}

final routes = <String, WidgetBuilder>{${routePaths.map((key, value) => MapEntry(key, "'/$key': (context) => $value")).values.join(", ")}};
    ''';
  }
}
