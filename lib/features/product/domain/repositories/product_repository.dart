import 'package:dartz/dartz.dart';
import 'package:halalfood/core/error/response.dart';
import 'package:halalfood/features/product/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<ResponseI, List<Product>>> getProducts(int limit, int offset);
}
