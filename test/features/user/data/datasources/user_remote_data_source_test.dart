import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:halalfood/core/dio/interceptor.dart';
import 'package:halalfood/features/user/data/datasources/user_remote_data_source.dart';
import 'package:halalfood/features/user/data/models/extended_user_model.dart';
import 'package:halalfood/features/user/data/models/helper/signin_helper_model.dart';
import 'package:halalfood/features/user/data/models/helper/signup_helper_extended_model.dart';
import 'package:halalfood/features/user/data/models/helper/signup_helper_model.dart';
import 'package:halalfood/features/user/data/models/user_model.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../custom_test/nice_test.dart';
import '../../../../additional/json_reader/json_reader.dart';

void main() {
  late UserRemoteDataSourceImpl client;
  late MockWebServer server;

  final headers = {'Content-Type': 'application/json'};
  const tSignInHelper = SignInHelperModel(
    email: 'test1@gmail.com',
    password: "test123",
  );
  final tUserData = (jsonDecode(jsonReader('user/extended_user.json')));
  final List<UserModel> tUserData1 =
      ((jsonDecode(jsonReader('user/user.json'))) as List<dynamic>)
          .map((e) => UserModel.fromJson(e))
          .toList();

  SharedPreferences.setMockInitialValues(
      {"userdata": json.encode(tUserData).toString()});
  final tSignUpHelper = SignUpHelperModel(
      email: "test123312@gmail.com",
      password: "test123",
      data: SignUpExtendedHelperModel(
          dateOfBirth: "test",
          firstName: "test",
          lastName: "test",
          phoneNumber: "test"));
  setUp(() async {
    server = MockWebServer();

    await server.start();
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    dio.interceptors.add(CustomInterceptor());
    client = UserRemoteDataSourceImpl(dio);
  });

  niceTest(
      'signup successfully and get user data if [there is no any user with these credentials]',
      setUp: () {
        server.enqueue(
            body: jsonEncode(jsonReader('user/extended_user.json')),
            headers: headers);
      },
      build: () => client,
      act: (client) async => await client.signUp(tSignUpHelper),
      customExpect: (user) {
        expect(user, isNotNull);

        expect(user.user.email, tUserData["user"]["email"]);
      });

  niceTest<UserRemoteDataSourceImpl>(
      'signin successfully and get user data if [there is no any user with these credentials]',
      setUp: () {
        server.enqueue(
            body: jsonEncode(jsonReader('user/extended_user_signin.json')),
            headers: headers);
      },
      build: () => client,
      act: (act) async => await act.signIn(tSignInHelper),
      customExpect: (result) {
        expect((result as ExtendedUserModel).user.email,
            tUserData["user"]["email"]);
      });

  niceTest(
    'getOneUser is successfull and returns one user data ',
    setUp: () {
      server.enqueue(httpCode: 200, body: tUserData1, headers: headers);
    },
    build: () => client,
    act: (act) async =>
        await act.getOneUser('f9502b32-da08-44f4-bc33-200e2a0707ad'),
    customExpect: (result) {
      expect(result[0].userId, tUserData1[0].userId);
    },
  );
}
