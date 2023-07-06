import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:halalfood/core/dio/interceptor.dart';
import 'package:halalfood/features/product/data/datasources/product_remote_data_source.dart';
import 'package:halalfood/features/product/data/repositories/product_repository_impl.dart';
import 'package:halalfood/features/product/domain/repositories/product_repository.dart';
import 'package:halalfood/features/product/domain/usecases/get_one_product_usecase.dart';
import 'package:halalfood/features/product/domain/usecases/get_product_usecase.dart';
import 'package:halalfood/features/product/presentation/cubit/product_cubit.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  initUseCases();
  initCubits();
  initDataSources();
  initRepositories();

  initExternals();
}

initCubits() {
  getIt.registerFactory(() =>
      ProductCubit(getProductUseCase: getIt(), getOneProductUseCase: getIt()));
}

initDataSources() {
  getIt.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(getIt()));
}

initUseCases() {
  getIt.registerLazySingleton(() => GetProductUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => GetOneProductUseCase(repository: getIt()));
}

initRepositories() {
  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(dataSource: getIt()));
}

initExternals() {
  getIt.registerLazySingleton(
      () => Dio()..interceptors.add(CustomInterceptor()));
}
