import 'package:dio/dio.dart';
import 'package:halalfood/features/product/data/models/product_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constant/constants.dart';
part 'product_remote_data_source.g.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts(int limit, int offset);
  Future<List<ProductModel>> getOneProduct(int id);
}

@RestApi(baseUrl: BASE_URL)
abstract class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  factory ProductRemoteDataSourceImpl(Dio dio, {String baseUrl}) =
      _ProductRemoteDataSourceImpl;

  @override
  @GET("products?limit={limit}&offset={offset}")
  Future<List<ProductModel>> getProducts(
      @Path("limit") int limit, @Path("offset") int offset);

  @override
  @GET("products?id=eq.{id}")
  Future<List<ProductModel>> getOneProduct(@Path("id") int id);
}
