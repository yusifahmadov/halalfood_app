import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:halalfood/features/user/data/models/helper/signup_helper_extended_model.dart';
import 'package:halalfood/features/user/data/models/helper/signup_helper_model.dart';

import 'package:halalfood/features/user/domain/entities/user_extended.dart';
import 'package:halalfood/features/user/domain/repositories/user_repository.dart';
import 'package:halalfood/features/user/domain/usecases/signin_usecase.dart';
import 'package:halalfood/features/user/domain/usecases/signup_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../custom_test/nice_test.dart';
import 'signup_usecase_test.mocks.dart';

@GenerateMocks([UserRepository, ExtendedUser])
void main() {
  late SignupUseCase useCase;
  late SignInUseCase signInUseCase;
  late MockUserRepository repository;

  setUp(() {
    repository = MockUserRepository();
    useCase = SignupUseCase(repository: repository);
  });
  final tUserExtended = MockExtendedUser();
  final tSignUpHelper = SignUpHelperModel(
      email: "test1@gmail.com",
      password: "test123",
      data: SignUpExtendedHelperModel(
          dateOfBirth: "test",
          firstName: "test",
          lastName: "test",
          phoneNumber: "test"));

  niceTest<SignupUseCase>("test signupUseCase",
      setUp: () async {
        when(repository.signUp(any))
            .thenAnswer((_) async => Right(tUserExtended));
      },
      build: () => useCase,
      act: (usecase) async => await usecase(tSignUpHelper),
      expect: () {
        return Right(tUserExtended);
      });
}
