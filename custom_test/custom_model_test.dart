import 'dart:async';

import 'package:flutter_test/flutter_test.dart' as test;
import 'package:meta/meta.dart';

@isTest
void testModel<T extends Object>(String description,
    {required dynamic json,
    required dynamic model,
    required T Function(Map<String, dynamic> json) fromJson,
    required Map<String, dynamic> Function() toJson}) async {
  modelTestFromJson<T>(
    description: description,
    json: json,
    model: model,
    fromJson: fromJson,
  );
  modelTestToJson<T>(
    description: description,
    json: json,
    model: model,
    toJson: toJson,
  );
}

@visibleForTesting
Future<void> modelTestFromJson<T>({
  required String description,
  required dynamic json,
  required T model,
  required T Function(Map<String, dynamic> json) fromJson,
}) async {
  try {
    _runZonedGuarded(() async {
      test.test(description, () async {
        final result = fromJson(json is List ? json[0] : json);
        test.expect(result, model);
      });
    });
  } catch (e) {
    throw Exception();
  }
}

@visibleForTesting
Future<void> modelTestToJson<T>(
    {required String description,
    required dynamic json,
    required T model,
    required Map<String, dynamic> Function() toJson}) async {
  try {
    _runZonedGuarded(() async {
      test.test(description, () async {
        final result = toJson();
        test.expect(result, json is List ? json[0] : json);
      });
    });
  } catch (e) {
    throw Exception();
  }
}

Future<void> _runZonedGuarded(Future<void> Function() body) {
  final completer = Completer<void>();
  runZonedGuarded(() async {
    await body();
    if (!completer.isCompleted) completer.complete();
  }, (error, stackTrace) {
    if (!completer.isCompleted) completer.completeError(error, stackTrace);
  });
  return completer.future;
}
