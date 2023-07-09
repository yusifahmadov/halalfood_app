import 'package:dartz/dartz.dart';
import 'package:halalfood/core/error/response.dart';
import 'package:halalfood/core/usecase/usecase.dart';
import 'package:halalfood/features/user/data/models/helper/signin_helper_model.dart';
import 'package:halalfood/features/user/domain/entities/user_extended.dart';
import 'package:halalfood/features/user/domain/repositories/user_repository.dart';

class SignInUseCase extends UseCase<ExtendedUser, SignInHelperModel> {
  UserRepository repository;
  SignInUseCase({required this.repository});
  @override
  Future<Either<ResponseI, ExtendedUser>> call(params) async {
    return await repository.signIn(params);
  }
}
