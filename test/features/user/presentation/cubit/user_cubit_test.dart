import 'package:flutter_test/flutter_test.dart';
import 'package:halalfood/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:halalfood/features/user/data/models/extended_user_model.dart';
import 'package:halalfood/features/user/domain/usecases/signin_usecase.dart';
import 'package:halalfood/features/user/domain/usecases/signup_usecase.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([SignupUseCase, SignInUseCase, AuthCubit, ExtendedUserModel])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  // late UserCubit userCubit;
  // late MockSignupUseCase signupUseCase;
  // late MockAuthCubit authCubit;
  // late MockSignInUseCase signInUseCase;
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

    // await EasyLoad.init();
    // EasyLoading.init();
    // authCubit = MockAuthCubit();
    // userCubit =
    //     UserCubit(signupUseCase: signupUseCase, signInUseCase: signInUseCase);
  });

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
