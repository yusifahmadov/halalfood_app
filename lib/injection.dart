import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:halalfood/core/dio/interceptor.dart';
import 'package:halalfood/features/product/data/datasources/product_remote_data_source.dart';
import 'package:halalfood/features/product/data/repositories/product_repository_impl.dart';
import 'package:halalfood/features/product/domain/repositories/product_repository.dart';
import 'package:halalfood/features/product/domain/usecases/get_one_product_usecase.dart';
import 'package:halalfood/features/product/domain/usecases/get_product_usecase.dart';
import 'package:halalfood/features/product/presentation/cubit/product_cubit.dart';
import 'package:halalfood/features/user/domain/usecases/signup_usecase.dart';
import 'package:halalfood/features/user/presentation/cubit/user_cubit.dart';

import 'features/user/data/datasources/user_remote_data_source.dart';
import 'features/user/data/repositories/user_repository_impl.dart';
import 'features/user/domain/repositories/user_repository.dart';

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
  getIt.registerFactory(() => UserCubit(
        signupUseCase: getIt(),
      ));
}

initDataSources() {
  getIt.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(getIt()));
  getIt.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(getIt()));
}

initUseCases() {
  getIt.registerLazySingleton(() => GetProductUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => GetOneProductUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => SignupUseCase(repository: getIt()));
}

initRepositories() {
  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(dataSource: getIt()));
  getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(dataSource: getIt()));
}

final navigatorKey = GlobalKey<NavigatorState>();
final mainContext = navigatorKey.currentContext;
initExternals() {
  getIt.registerLazySingleton(() => navigatorKey);

  getIt.registerLazySingleton(
      () => Dio()..interceptors.add(CustomInterceptor()));
}
