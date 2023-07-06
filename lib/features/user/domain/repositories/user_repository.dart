import 'package:dartz/dartz.dart';
import 'package:halalfood/core/error/response.dart';
import 'package:halalfood/features/user/domain/entities/user_extended.dart';

abstract class UserRepository {
  Future<Either<ResponseI, ExtendedUser>> signUp(String email, String password);
}
