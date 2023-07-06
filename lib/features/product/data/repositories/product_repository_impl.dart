import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:halalfood/features/product/data/datasources/product_remote_data_source.dart';
import 'package:halalfood/features/product/domain/entities/product.dart';
import 'package:halalfood/features/product/domain/repositories/product_repository.dart';

import '../../../../core/error/response.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRemoteDataSourceImpl dataSource;
  ProductRepositoryImpl({required this.dataSource});
  @override
  Future<Either<ResponseI, List<Product>>> getProducts(
      int limit, int offset) async {
    try {
      return Right(await dataSource.getProducts(limit, offset));
    } on DioException catch (e) {
      if (e.response!.statusCode == 500) {
        return const Left(ResponseI(message: "Xəta baş verdi!"));
      }
      return Left(ResponseI(message: e.response.toString()));
    }
  }
}
