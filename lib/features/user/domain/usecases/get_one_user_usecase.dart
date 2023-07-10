import 'package:dartz/dartz.dart';
import 'package:halalfood/core/error/response.dart';
import 'package:halalfood/core/usecase/usecase.dart';
import 'package:halalfood/features/user/domain/repositories/user_repository.dart';

import '../entities/user.dart';

class GetOneUserUseCase extends UseCase<List<User>, String> {
  UserRepository repository;
  GetOneUserUseCase({required this.repository});
  @override
  Future<Either<ResponseI, List<User>>> call(String params) {
    return repository.getOneUser(params);
  }
}
