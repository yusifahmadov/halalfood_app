import 'package:dartz/dartz.dart';
import 'package:halalfood/core/error/response.dart';
import 'package:halalfood/core/usecase/usecase.dart';
import 'package:halalfood/features/user/domain/entities/helper/signup_helper.dart';
import 'package:halalfood/features/user/domain/entities/user_extended.dart';
import 'package:halalfood/features/user/domain/repositories/user_repository.dart';

class SignupUseCase extends UseCase<ExtendedUser, SignupHelper> {
  UserRepository repository;
  SignupUseCase({required this.repository});
  @override
  Future<Either<ResponseI, ExtendedUser>> call(SignupHelper params) async {
    return await repository.signUp(params.email, params.email);
  }
}
