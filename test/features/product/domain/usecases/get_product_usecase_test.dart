import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:halalfood/core/error/response.dart';
import 'package:halalfood/features/product/domain/entities/helper/pagination_params.dart';
import 'package:halalfood/features/product/domain/entities/product.dart';
import 'package:halalfood/features/product/domain/repositories/product_repository.dart';
import 'package:halalfood/features/product/domain/usecases/get_product_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_product_usecase_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late GetProductUseCase usecase;
  late MockProductRepository repository;

  setUp(() {
    repository = MockProductRepository();
    usecase = GetProductUseCase(repository: repository);
  });

  test(
    "should return data from product repository",
    () async {
      final tProductList = [
        const Product(
            createdAt: '',
            description: '',
            id: 1,
            location: [1, 1],
            name: 'Test food')
      ];

      when(repository.getProducts(any, any))
          .thenAnswer((_) async => Right(tProductList));

      final result = await usecase(PaginationParams());
      verify(repository.getProducts(10, 0));

      expect(result, Right(tProductList));
    },
  );

  test(
    "should return Response from repository when fails",
    () async {
      final tResponse = const ResponseI(message: '');
      when(repository.getProducts(any, any))
          .thenAnswer((_) async => Left(tResponse));

      final result = await usecase(PaginationParams());
      verify(repository.getProducts(10, 0));
      expect(result, Left(tResponse));
    },
  );
}
