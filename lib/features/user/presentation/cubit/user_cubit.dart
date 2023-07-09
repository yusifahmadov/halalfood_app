import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:halalfood/core/easy_loading/easy_loading.dart';
import 'package:halalfood/core/flasher/custom_flasher.dart';
import 'package:halalfood/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:halalfood/features/user/data/models/helper/signup_helper_model.dart';
import 'package:halalfood/features/user/domain/usecases/signin_usecase.dart';
import 'package:halalfood/features/user/domain/usecases/signup_usecase.dart';

import 'package:rxdart/rxdart.dart';

import '../../data/models/helper/signin_helper_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  SignupUseCase signupUseCase;
  SignInUseCase signInUseCase;
  UserCubit({required this.signupUseCase, required this.signInUseCase})
      : super(UserInitial());

  final _signUpPasswordController = BehaviorSubject<bool>.seeded(true);
  Stream<bool> get signUpPasswordStream => _signUpPasswordController.stream;
  final _signInPasswordController = BehaviorSubject<bool>.seeded(true);
  Stream<bool> get signInPasswordStream => _signInPasswordController.stream;
  final _signUpAgainPasswordController = BehaviorSubject<bool>.seeded(true);
  Stream<bool> get signUpAgainPasswordStream =>
      _signUpAgainPasswordController.stream;

  updateSignupPasswordControllerValue(bool value) async =>
      _signUpPasswordController.add(value);
  updateSigninPasswordControllerValue(bool value) async =>
      _signInPasswordController.add(value);
  updateSignupAgainPasswordControllerValue(bool value) async =>
      _signUpPasswordController.add(value);

  signUp(
      {required SignUpHelperModel helper, required AuthCubit authCubit}) async {
    await EasyLoad.show();

    final response = await signupUseCase(helper);
    response.fold((l) {
      emit(SignupFailed());
      CustomFlasher.showError(l.message);
    }, (r) async {
      emit(SignupSuccess());
      authCubit.loggedIn(r);
      CustomFlasher.showSuccess("Qeydiyyat uğurla tamamlandı!");
    });
    await EasyLoad.dismiss();
  }

  signIn(
      {required SignInHelperModel helper, required AuthCubit authCubit}) async {
    await EasyLoad.show();

    final response = await signInUseCase(helper);
    response.fold((l) {
      emit(SigninFailed());
      CustomFlasher.showError(l.message);
    }, (r) async {
      emit(SigninSuccess());
      authCubit.loggedIn(r);
      CustomFlasher.showSuccess("Giriş edildi!");
    });
    await EasyLoad.dismiss();
  }

  @override
  Future<void> close() {
    _signUpPasswordController.close();
    _signUpAgainPasswordController.close();
    return super.close();
  }
}
