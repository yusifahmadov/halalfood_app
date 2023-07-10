import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:halalfood/features/user/domain/entities/user.dart';
import 'package:halalfood/features/user/domain/usecases/get_one_user_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../custom_test/nice_test.dart';
import 'signup_usecase_test.mocks.dart';

@GenerateMocks([User])
void main() {
  late GetOneUserUseCase useCase;
  late MockUserRepository repository;
  setUp(() {
    repository = MockUserRepository();
    useCase = GetOneUserUseCase(repository: repository);
  });

  niceTest(
    'should return List<User> from repository',
    setUp: () => when(repository.getOneUser(any))
        .thenAnswer((_) async => const Right([])),
    build: () => useCase,
    act: (act) => act.call('f9502b32-da08-44f4-bc33-200e2a0707ad'),
    expect: () => const Right(<User>[]),
    verify: () => repository.getOneUser('f9502b32-da08-44f4-bc33-200e2a0707ad'),
  );
}
