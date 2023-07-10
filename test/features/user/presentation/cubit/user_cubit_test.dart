import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:halalfood/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:halalfood/features/user/data/models/extended_user_model.dart';
import 'package:halalfood/features/user/data/models/user_model.dart';
import 'package:halalfood/features/user/domain/usecases/get_one_user_usecase.dart';
import 'package:halalfood/features/user/domain/usecases/signin_usecase.dart';
import 'package:halalfood/features/user/domain/usecases/signup_usecase.dart';
import 'package:halalfood/features/user/presentation/cubit/user_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../additional/json_reader/json_reader.dart';
import 'user_cubit_test.mocks.dart';

@GenerateMocks([
  SignupUseCase,
  SignInUseCase,
  AuthCubit,
  ExtendedUserModel,
  GetOneUserUseCase
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late UserCubit userCubit;
  late MockGetOneUserUseCase getOneUserUseCase;
  late MockSignupUseCase signupUseCase;
  // late MockAuthCubit authCubit;
  late MockSignInUseCase signInUseCase;
  final tExtendedUserData =
      ((jsonDecode(jsonReader('user/extended_user.json'))));
  final tUserData = ((jsonDecode(jsonReader('user/user.json'))) as List)
      .map((e) => UserModel.fromJson(e))
      .toList();

  SharedPreferences.setMockInitialValues(
      {"userdata": json.encode(tExtendedUserData).toString()});
  // const tSignInHelper =
  //     SignInHelperModel(email: 'yusifakhmad20@gmail.com', password: 'yusif123');
  // final tSignupHelper = SignUpHelperModel(
  //     email: "test123123@gmail.com",
  //     password: "test123",
  //     data: SignUpExtendedHelperModel(
  //         dateOfBirth: "test",
  //         firstName: "test",
  //         lastName: "test",
  //         phoneNumber: "test"));

  setUp(() async {
    // signInUseCase = MockSignInUseCase();
    // signupUseCase = MockSignupUseCase();
    signInUseCase = MockSignInUseCase();
    signupUseCase = MockSignupUseCase();
    getOneUserUseCase = MockGetOneUserUseCase();
    userCubit = UserCubit(
        signupUseCase: signupUseCase,
        signInUseCase: signInUseCase,
        getOneUserUseCase: getOneUserUseCase);
    // await EasyLoad.init();
    // EasyLoading.init();
    // authCubit = MockAuthCubit();
    // userCubit =
    //     UserCubit(signupUseCase: signupUseCase, signInUseCase: signInUseCase);
  });

  blocTest(
    'when getOneUser is success, emits [UserInformationLoading, UserInformationLoaded]',
    build: () => userCubit,
    setUp: () =>
        when(getOneUserUseCase(any)).thenAnswer((_) async => Right(tUserData)),
    act: (bloc) async => await bloc.getUserInformation(),
    expect: () =>
        [UserInformationLoading(), UserInformationLoaded(data: tUserData[0])],
  );

  // blocTest(
  //   'when signup is success, emits [SignupSuccess]',
  //   build: () => userCubit,
  //   setUp: () => when(signupUseCase(any))
  //       .thenAnswer((_) async => Right(MockExtendedUserModel())),
  //   expect: () => <UserState>[SignupSuccess()],
  //   act: (bloc) => bloc.signUp(
  //     helper: tSignupHelper,
  //     authCubit: authCubit,
  //   ),
  // );

  // blocTest(
  //   'when signin is success, emits [SigninSuccess]',
  //   build: () => userCubit,
  //   setUp: () => when(signInUseCase(any))
  //       .thenAnswer((_) async => Right(MockExtendedUserModel())),
  //   expect: () => <UserState>[SigninSuccess()],
  //   act: (bloc) => bloc.signIn(
  //     helper: tSignInHelper,
  //     authCubit: authCubit,
  //   ),
  // );
}
