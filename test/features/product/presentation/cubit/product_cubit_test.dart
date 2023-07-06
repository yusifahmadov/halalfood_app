import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:halalfood/core/error/response.dart';
import 'package:halalfood/features/product/data/models/product_model.dart';
import 'package:halalfood/features/product/domain/entities/helper/pagination_params.dart';
import 'package:halalfood/features/product/domain/usecases/get_product_usecase.dart';
import 'package:halalfood/features/product/presentation/cubit/product_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../additional/json_reader/json_reader.dart';
import 'package:bloc_test/bloc_test.dart';
import 'product_cubit_test.mocks.dart';

@GenerateMocks([
  GetProductUseCase,
])
void main() {
  late ProductCubit cubit;
  late MockGetProductUseCase useCase;

  setUp(() {
    useCase = MockGetProductUseCase();
    cubit = ProductCubit(getProductUseCase: useCase);
  });

  group('getProducts', () {
    final tParams = PaginationParams();
    final tProducts =
        (jsonDecode(jsonReader('product/products.json')) as List<dynamic>)
            .map((e) => ProductModel.fromJson(e))
            .toList();
    test(
      "initial state should be ProductInitial",
      () async {
        expect(cubit.state, ProductInitial());
      },
    );
    test(
      "should get data from cubit",
      () async {
        when(useCase(any)).thenAnswer((_) async => Right(tProducts));
        await cubit.getProducts(tParams);
        verify(useCase(tParams));
      },
    );
    blocTest<ProductCubit, ProductState>(
      'emits [ProductDataLoading, ProductDataLoaded] when GetProducts is called.',
      build: () => cubit,
      setUp: () {
        when(useCase(any)).thenAnswer((_) async => Right(tProducts));
      },
      act: (bloc) => bloc.getProducts(tParams),
      expect: () => <ProductState>[
        ProductDataLoading(),
        ProductDataLoaded(data: tProducts)
      ],
    );
    blocTest<ProductCubit, ProductState>(
      'emits [ProductDataLoading, ProductDataFailed] when GetProducts is called.',
      build: () => cubit,
      setUp: () {
        when(useCase(any))
            .thenAnswer((_) async => const Left(ResponseI(message: '')));
      },
      act: (bloc) => bloc.getProducts(tParams),
      expect: () => <ProductState>[
        ProductDataLoading(),
        const ProductDataFailed(message: ResponseI(message: 'Error happaned'))
      ],
    );
  });
}
