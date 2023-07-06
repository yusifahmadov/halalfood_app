import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:halalfood/core/error/response.dart';
import 'package:halalfood/features/product/data/datasources/product_remote_data_source.dart';
import 'package:halalfood/features/product/data/models/product_model.dart';
import 'package:halalfood/features/product/data/repositories/product_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../additional/json_reader/json_reader.dart';
import 'product_repository_impl_test.mocks.dart';

@GenerateMocks([
  ProductRemoteDataSourceImpl,
])
void main() {
  late ProductRepositoryImpl repository;
  late MockProductRemoteDataSourceImpl dataSource;

  setUp(() {
    dataSource = MockProductRemoteDataSourceImpl();
    repository = ProductRepositoryImpl(dataSource: dataSource);
  });

  group('getProducts', () {
    final tProducts =
        (jsonDecode(jsonReader('product/products.json')) as List<dynamic>)
            .map((e) => ProductModel.fromJson(e))
            .toList();

    test(
      "should return products when getProduct is called from dataSource",
      () async {
        when(dataSource.getProducts(any, any))
            .thenAnswer((_) async => tProducts);
        final result = await repository.getProducts(10, 0);
        verify(dataSource.getProducts(10, 0));
        expect(result, Right(tProducts));
        verifyNoMoreInteractions(dataSource);
      },
    );
    test(
      "should return [Error Response] when getProduct is called unsuccessfully",
      () async {
        when(dataSource.getProducts(any, any)).thenThrow(DioException(
            requestOptions: RequestOptions(),
            response: Response(
                requestOptions: RequestOptions(), data: 'Error happened!')));
        final result = await repository.getProducts(10, 0);
        verify(dataSource.getProducts(10, 0));
        expect(result, const Left(ResponseI(message: 'Error happened!')));
      },
    );
    test(
      "should return special [Error Response] message, when getProduct is called unsuccessfully (500 error)",
      () async {
        when(dataSource.getProducts(any, any)).thenThrow(DioException(
            requestOptions: RequestOptions(),
            response:
                Response(statusCode: 500, requestOptions: RequestOptions())));
        final result = await repository.getProducts(10, 0);
        verify(dataSource.getProducts(10, 0));
        expect(result, left(const ResponseI(message: 'Xəta baş verdi!')));
      },
    );
  });
}
