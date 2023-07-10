import 'package:dartz/dartz.dart';
import 'package:halalfood/core/error/response.dart';
import 'package:halalfood/features/user/data/models/helper/signin_helper_model.dart';
import 'package:halalfood/features/user/domain/entities/user.dart';
import 'package:halalfood/features/user/domain/entities/user_extended.dart';

import '../../data/models/helper/signup_helper_model.dart';

abstract class UserRepository {
  Future<Either<ResponseI, ExtendedUser>> signUp(SignUpHelperModel body);
  Future<Either<ResponseI, ExtendedUser>> signIn(SignInHelperModel body);
  Future<Either<ResponseI, List<User>>> getOneUser(String id);
}
