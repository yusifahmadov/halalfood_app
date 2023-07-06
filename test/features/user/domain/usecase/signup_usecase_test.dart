import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:halalfood/features/user/domain/entities/helper/signup_helper.dart';
import 'package:halalfood/features/user/domain/entities/user_extended.dart';
import 'package:halalfood/features/user/domain/repositories/user_repository.dart';
import 'package:halalfood/features/user/domain/usecases/signup_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'signup_usecase_test.mocks.dart';

@GenerateMocks([UserRepository, ExtendedUser])
void main() {
  late SignupUseCase useCase;
  late MockUserRepository repository;

  setUp(() {
    repository = MockUserRepository();
    useCase = SignupUseCase(repository: repository);
  });

  test(
    "should return [ExtendedUser] data from repository",
    () async {
      final tUserExtended = MockExtendedUser();
      final tSignupHelper = SignupHelper(email: "", password: "");
      when(repository.signUp(any, any))
          .thenAnswer((_) async => Right(tUserExtended));
      final result = await useCase(tSignupHelper);
      verify(repository.signUp(any, any));
      expect(result, Right(tUserExtended));
    },
  );
}
