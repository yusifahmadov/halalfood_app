import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:halalfood/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:halalfood/features/user/data/models/extended_user_model.dart';
import 'package:halalfood/features/user/data/models/helper/signup_helper_extended_model.dart';
import 'package:halalfood/features/user/data/models/helper/signup_helper_model.dart';
import 'package:halalfood/features/user/domain/usecases/signin_usecase.dart';
import 'package:halalfood/features/user/domain/usecases/signup_usecase.dart';
import 'package:halalfood/features/user/presentation/cubit/user_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_cubit_test.mocks.dart';

@GenerateMocks([SignupUseCase, SignInUseCase, AuthCubit, ExtendedUserModel])
void main() {
  late UserCubit userCubit;
  late MockSignupUseCase signupUseCase;
  late MockAuthCubit authCubit;
  late MockSignInUseCase signInUseCase;
  final tSignupHelper = SignUpHelperModel(
      email: "test123123@gmail.com",
      password: "test123",
      data: SignUpExtendedHelperModel(
          dateOfBirth: "test",
          firstName: "test",
          lastName: "test",
          phoneNumber: "test"));

  setUp(() {
    signInUseCase = MockSignInUseCase();
    signupUseCase = MockSignupUseCase();
    authCubit = MockAuthCubit();
    userCubit =
        UserCubit(signupUseCase: signupUseCase, signInUseCase: signInUseCase);
  });

  blocTest(
    'when signup is success, emits [SignupSuccess]',
    build: () => userCubit,
    setUp: () => when(signupUseCase(any))
        .thenAnswer((_) async => Right(MockExtendedUserModel())),
    expect: () => <UserState>[SignupSuccess()],
    act: (bloc) => bloc.signUp(
      helper: tSignupHelper,
      authCubit: authCubit,
    ),
  );
}
