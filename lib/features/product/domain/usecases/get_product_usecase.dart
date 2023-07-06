import 'package:dartz/dartz.dart';
import 'package:halalfood/core/error/response.dart';
import 'package:halalfood/core/usecase/usecase.dart';
import 'package:halalfood/features/product/domain/entities/helper/pagination_params.dart';
import 'package:halalfood/features/product/domain/entities/product.dart';

import '../repositories/product_repository.dart';

class GetProductUseCase extends UseCase<List<Product>, PaginationParams> {
  ProductRepository repository;
  GetProductUseCase({required this.repository});
  @override
  Future<Either<ResponseI, List<Product>>> call(PaginationParams params) async {
    return await repository.getProducts(params.limit, params.offset);
  }
}
