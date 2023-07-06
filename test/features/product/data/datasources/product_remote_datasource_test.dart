import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:halalfood/core/constant/constants.dart';
import 'package:halalfood/core/dio/interceptor.dart';
import 'package:halalfood/features/product/data/datasources/product_remote_data_source.dart';
import 'package:halalfood/features/product/data/models/product_model.dart';
import 'package:mock_web_server/mock_web_server.dart';

import '../../../../additional/json_reader/json_reader.dart';

void main() {
  late ProductRemoteDataSourceImpl client;
  late MockWebServer server;
  final headers = {'Content-Type': 'application/json'};

  setUp(() async {
    server = MockWebServer();

    await server.start();
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    dio.interceptors.add(CustomInterceptor());
    client = ProductRemoteDataSourceImpl(dio, baseUrl: BASE_URL);
  });

  group('getProducts', () {
    final tProducts =
        (jsonDecode(jsonReader('product/products.json')) as List<dynamic>)
            .map((e) => ProductModel.fromJson(e))
            .toList();

    test("get all products from url and check with our json", () async {
      server.enqueue(
          body: jsonEncode(jsonReader('product/products.json')),
          headers: headers);
      final tasks = await client.getProducts(10, 0);
      expect(tasks, isNotNull);
      expect(tasks.length, 3);

      expect(tasks, tProducts);
    });
  });

  group('getOneProduct', () {
    test("get one product from url and check with our json", () async {
      final tProducts =
          (jsonDecode(jsonReader('product/product.json')) as List<dynamic>)
              .map((e) => ProductModel.fromJson(e))
              .toList();
      server.enqueue(
          body: jsonEncode(jsonReader('product/product.json')),
          headers: headers);
      final tasks = await client.getOneProduct(1);
      expect(tasks, isNotNull);
      expect(tasks.length, 1);

      expect(tasks, tProducts);
    });
  });
}
