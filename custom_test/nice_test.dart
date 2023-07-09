import 'dart:async';
import 'package:flutter_test/flutter_test.dart' as test;
import 'package:meta/meta.dart';

@isTest
void niceTest<B>(
  String description, {
  required FutureOr<void> Function()? setUp,
  required B Function() build,
  dynamic Function()? expect,
  dynamic Function()? verify,
  dynamic Function(B act)? act,
  dynamic Function(dynamic result)? customExpect,
}) {
  testForSomething(description,
      setUp: setUp,
      build: build,
      customExpect: customExpect,
      act: act,
      expect: expect,
      verify: verify);
}

@visibleForTesting
Future<void> testForSomething<B>(
  String description, {
  required FutureOr<void> Function()? setUp,
  required B Function() build,
  dynamic Function()? expect,
  dynamic Function(dynamic result)? customExpect,
  dynamic Function()? verify,
  dynamic Function(B act)? act,
}) async {
  try {
    _runZonedGuarded(() async {
      test.test(description, () async {
        setUp?.call();
        final built = build();

        final result = await act?.call(built);

        if (expect != null) {
          final dynamic expected = expect();
          test.expect(expected, result);
        }
        if (customExpect != null) {
          customExpect(result);
        }
        verify?.call();
      });
    });
  } catch (e) {
    throw Exception(e.toString());
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
