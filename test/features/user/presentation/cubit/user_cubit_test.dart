// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:halalfood/core/flasher/custom_flasher.dart';
// import 'package:halalfood/features/user/domain/entities/helper/signup_helper.dart';
// import 'package:halalfood/features/user/domain/entities/user_extended.dart';
// import 'package:halalfood/features/user/domain/usecases/signup_usecase.dart';
// import 'package:halalfood/features/user/presentation/cubit/user_cubit.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import 'user_cubit_test.mocks.dart';

// @GenerateMocks([SignupUseCase, ExtendedUser, CustomFlasher])
// void main() {
//   TestWidgetsFlutterBinding.ensureInitialized();
//   late UserCubit cubit;
//   late MockSignupUseCase signupUseCase;

//   late MockExtendedUser user;
//   setUp(() {
//     user = MockExtendedUser();
//     signupUseCase = MockSignupUseCase();
//     cubit = UserCubit(signupUseCase: signupUseCase);
//   });
//   group('signUp', () {
//     final signUpHelper =
//         SignupHelper(email: "8292@gmail.com", password: "test123");
//     test(
//       "verify customflasher is called",
//       () async {
//         when(signupUseCase(any)).thenAnswer((_) async => Right(user));
//         await cubit.signUp(signUpHelper);
//         verify(signupUseCase(any));
//       },
//     );
//   });
// }
