import 'package:dartz/dartz.dart';
import 'package:halalfood/core/error/response.dart';
import 'package:halalfood/core/usecase/usecase.dart';
import 'package:halalfood/features/product/domain/repositories/product_repository.dart';

import '../entities/product.dart';

class GetOneProductUseCase extends UseCase<List<Product>, int> {
  ProductRepository repository;
  GetOneProductUseCase({required this.repository});
  @override
  Future<Either<ResponseI, List<Product>>> call(int params) async {
    return await repository.getOneProduct(params);
  }
}
