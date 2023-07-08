import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:halalfood/core/easy_loading/easy_loading.dart';
import 'package:halalfood/core/flasher/custom_flasher.dart';
import 'package:halalfood/features/user/data/models/helper/signup_helper_model.dart';
import 'package:halalfood/features/user/domain/usecases/signup_usecase.dart';

import 'package:rxdart/rxdart.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  SignupUseCase signupUseCase;
  UserCubit({required this.signupUseCase}) : super(UserInitial());

  final _signUpPasswordController = BehaviorSubject<bool>.seeded(true);
  Stream<bool> get signUpPasswordStream => _signUpPasswordController.stream;
  final _signUpAgainPasswordController = BehaviorSubject<bool>.seeded(true);
  Stream<bool> get signUpAgainPasswordStream =>
      _signUpAgainPasswordController.stream;

  updateSignupPasswordControllerValue(bool value) async =>
      _signUpPasswordController.add(value);
  updateSignupAgainPasswordControllerValue(bool value) async =>
      _signUpAgainPasswordController.add(value);

  signUp({required SignUpHelperModel helper}) async {
    await EasyLoad.show();

    final response = await signupUseCase(helper);
    response.fold((l) {
      emit(SignupFailed());
      CustomFlasher.showError(l.message);
    }, (r) async {
      emit(SignupSuccess());
      CustomFlasher.showSuccess("Qeydiyyat uğurla tamamlandı!");
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
