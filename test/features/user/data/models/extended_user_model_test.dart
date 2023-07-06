import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:halalfood/features/user/data/models/extended_user_model.dart';
import 'package:halalfood/features/user/data/models/user_model.dart';

import '../../../../additional/json_reader/json_reader.dart';

void main() {
  late ExtendedUserModel model;
  late UserModel userModel;
  final tUser = jsonDecode(jsonReader('user/extended_user.json'));
  setUp(() {
    userModel = const UserModel(
        id: 2,
        name: "Test",
        surname: "Test",
        age: 1,
        phoneNumber: "1",
        email: "1",
        createdAt: "2023-07-06T17:30:08.138404+00:00",
        userId: "ef20986f-35c8-4465-9b85-4c721e299685");
    model = ExtendedUserModel(
        accessToken:
            "eyJhbGciOiJIUzI1NiIsImtpZCI6IlBBck1ZbmhRQUhJNWlacmIiLCJ0eXAiOiJKV1QifQ.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjg4NjY0MzA0LCJpYXQiOjE2ODg2NjA3MDQsImlzcyI6Imh0dHBzOi8vaHR0cHM6Ly9rdm9tdWNnbWxyeWthbGtnbXp0Yi5zdXBhYmFzZS5jby9hdXRoL3YxIiwic3ViIjoiZWYyMDk4NmYtMzVjOC00NDY1LTliODUtNGM3MjFlMjk5Njg1IiwiZW1haWwiOiJ5dXNpZmFraG1hZEBlbWFpbC5jb20iLCJwaG9uZSI6IiIsImFwcF9tZXRhZGF0YSI6eyJwcm92aWRlciI6ImVtYWlsIiwicHJvdmlkZXJzIjpbImVtYWlsIl19LCJ1c2VyX21ldGFkYXRhIjp7fSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJwYXNzd29yZCIsInRpbWVzdGFtcCI6MTY4ODY2MDcwNH1dLCJzZXNzaW9uX2lkIjoiOWFmZDJmOTMtY2U4YS00NjYxLWEzNGQtOTVmZDY5YWVmZDM2In0.IaBXDLMNYIxo9C6xPwarPqPg0ZIK_tHNiZr_qUOI5Ts",
        refreshToken: "IABfa6bsRHWK3TuIF4xdSw",
        user: userModel);
  });

  group('fromJson', () {
    test(
      "fromJson should return a model",
      () async {
        print(tUser);
        final result = ExtendedUserModel.fromJson(tUser);
        expect(result.accessToken, model.accessToken);
      },
    );
  });
  group('toJson', () {
    test(
      "toJson should return a json",
      () async {
        final result = model.toJson();
        expect(result["access_token"], tUser["access_token"]);
        expect(result["refresh_token"], tUser["refresh_token"]);
      },
    );
  });
}
