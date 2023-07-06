import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:halalfood/features/user/data/models/user_model.dart';

import '../../../../additional/json_reader/json_reader.dart';

void main() {
  late UserModel model;
  final tUser = jsonDecode(jsonReader('user/user.json'));
  setUp(() {
    model = const UserModel(
        id: 2,
        name: "Test",
        surname: "Test",
        age: 1,
        phoneNumber: "1",
        email: "1",
        createdAt: "2023-07-06T17:30:08.138404+00:00",
        userId: "ef20986f-35c8-4465-9b85-4c721e299685");
  });

  group('fromJson', () {
    test(
      "fromJson should return a model",
      () async {
        final result = UserModel.fromJson(tUser[0]);
        expect(result, model);
      },
    );
  });
  group('toJson', () {
    test(
      "toJson should return a json",
      () async {
        final result = model.toJson();
        expect(result, tUser[0]);
      },
    );
  });
}
