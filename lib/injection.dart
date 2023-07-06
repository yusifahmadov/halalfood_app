import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:halalfood/core/dio/interceptor.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  initCubits();
  initDataSources();
  initRepositories();
  initUseCases();
  initExternals();
}

initCubits() {}
initDataSources() {}
initUseCases() {}
initRepositories() {}
initExternals() {
  getIt.registerLazySingleton(
      () => Dio()..interceptors.add(CustomInterceptor()));
}
