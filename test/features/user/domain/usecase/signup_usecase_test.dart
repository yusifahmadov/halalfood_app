import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:halalfood/features/user/data/models/helper/signup_helper_extended_model.dart';
import 'package:halalfood/features/user/data/models/helper/signup_helper_model.dart';
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
      final tSignUpHelper = SignUpHelperModel(
          email: "test1@gmail.com",
          password: "test123",
          data: SignUpExtendedHelperModel(
              dateOfBirth: "test",
              firstName: "test",
              lastName: "test",
              phoneNumber: "test"));
      when(repository.signUp(any))
          .thenAnswer((_) async => Right(tUserExtended));
      final result = await useCase(tSignUpHelper);
      verify(repository.signUp(any));
      expect(result, Right(tUserExtended));
    },
  );
}
