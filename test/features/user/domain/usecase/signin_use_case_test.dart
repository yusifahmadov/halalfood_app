import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:halalfood/features/user/data/models/helper/signin_helper_model.dart';
import 'package:halalfood/features/user/domain/usecases/signin_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../../../custom_test/nice_test.dart';
import 'signup_usecase_test.mocks.dart';

void main() {
  late SignInUseCase signInUseCase;
  late MockUserRepository repository;
  final tUserExtended = MockExtendedUser();

  const tSignInHelper = SignInHelperModel(
    email: "test1@gmail.com",
    password: "test123",
  );
  setUp(() {
    repository = MockUserRepository();
    signInUseCase = SignInUseCase(repository: repository);
  });
  niceTest(
    'test signInUseCase',
    setUp: () => when(repository.signIn(any))
        .thenAnswer((_) async => Right(tUserExtended)),
    build: () => signInUseCase,
    act: (useCase) => useCase(tSignInHelper),
    expect: () => Right(tUserExtended),
    verify: () => repository.signIn(tSignInHelper),
  );
}
