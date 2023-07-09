import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:halalfood/core/error/response.dart';
import 'package:halalfood/features/user/data/datasources/user_remote_data_source.dart';
import 'package:halalfood/features/user/domain/entities/user_extended.dart';
import 'package:halalfood/features/user/domain/repositories/user_repository.dart';

import '../models/helper/signin_helper_model.dart';
import '../models/helper/signup_helper_model.dart';

class UserRepositoryImpl implements UserRepository {
  UserRemoteDataSource dataSource;
  UserRepositoryImpl({required this.dataSource});
  @override
  Future<Either<ResponseI, ExtendedUser>> signUp(SignUpHelperModel body) async {
    try {
      return Right(await dataSource.signUp(body));
    } on DioException catch (e) {
      if (e.response!.statusCode == 500) {
        return const Left(ResponseI(message: "Xəta baş verdi!"));
      }
      return Left(ResponseI(message: e.response.toString()));
    }
  }

  @override
  Future<Either<ResponseI, ExtendedUser>> signIn(SignInHelperModel body) async {
    try {
      return Right(await dataSource.signIn(body));
    } on DioException catch (e) {
      if (e.response!.statusCode == 500) {
        return const Left(ResponseI(message: "Xəta baş verdi!"));
      }
      return Left(ResponseI(message: e.response.toString()));
    }
  }
}
