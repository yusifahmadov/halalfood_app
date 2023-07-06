import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:halalfood/core/dio/interceptor.dart';
import 'package:halalfood/features/user/data/datasources/user_remote_data_source.dart';
import 'package:mock_web_server/mock_web_server.dart';

import '../../../../additional/json_reader/json_reader.dart';

void main() {
  late UserRemoteDataSourceImpl client;
  late MockWebServer server;
  final headers = {'Content-Type': 'application/json'};

  setUp(() async {
    server = MockWebServer();

    await server.start();
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    dio.interceptors.add(CustomInterceptor());
    client = UserRemoteDataSourceImpl(dio);
  });

  group('signUp', () {
    final tUserData = (jsonDecode(jsonReader('user/extended_user.json')));

    test(
        "signup successfully and get user data if [there is no any user with these credentials]",
        () async {
      server.enqueue(
          body: jsonEncode(jsonReader('user/extended_user.json')),
          headers: headers);
      final user = await client.signUp("yusif333@gmail.com", "yusif123");
      expect(user, isNotNull);

      expect(user.user.email, tUserData["user"]["email"]);
    });
  });
}
