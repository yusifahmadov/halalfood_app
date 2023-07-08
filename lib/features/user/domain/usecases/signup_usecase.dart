import 'package:dartz/dartz.dart';
import 'package:halalfood/core/error/response.dart';
import 'package:halalfood/core/usecase/usecase.dart';
import 'package:halalfood/features/user/data/models/helper/signup_helper_model.dart';
import 'package:halalfood/features/user/domain/entities/user_extended.dart';
import 'package:halalfood/features/user/domain/repositories/user_repository.dart';

class SignupUseCase extends UseCase<ExtendedUser, SignUpHelperModel> {
  UserRepository repository;
  SignupUseCase({required this.repository});
  @override
  Future<Either<ResponseI, ExtendedUser>> call(SignUpHelperModel params) async {
    return await repository.signUp(params);
  }
}
