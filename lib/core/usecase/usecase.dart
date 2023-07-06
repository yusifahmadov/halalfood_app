import 'package:dartz/dartz.dart';
import 'package:halalfood/core/error/response.dart';

abstract class UseCase<A, T> {
  Future<Either<ResponseI, A>> call(T params);
}
