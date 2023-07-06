import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:halalfood/features/product/data/models/product_model.dart';
import 'package:halalfood/features/product/domain/repositories/product_repository.dart';
import 'package:halalfood/features/product/domain/usecases/get_one_product_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../additional/json_reader/json_reader.dart';
import 'get_product_usecase_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late GetOneProductUseCase useCase;
  late MockProductRepository repository;

  setUp(() {
    repository = MockProductRepository();
    useCase = GetOneProductUseCase(repository: repository);
  });

  test(
    "should return data from repository",
    () async {
      final tProduct =
          (jsonDecode(jsonReader('product/product.json')) as List<dynamic>)
              .map((e) => ProductModel.fromJson(e))
              .toList();
      when(repository.getOneProduct(any))
          .thenAnswer((_) async => Right(tProduct));

      final result = await useCase(1);
      verify(repository.getOneProduct(any));
      expect(result, Right(tProduct));
    },
  );
}
