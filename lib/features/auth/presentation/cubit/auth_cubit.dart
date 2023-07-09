import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:halalfood/core/flasher/custom_flasher.dart';
import 'package:halalfood/core/shared_preferences/custom_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../user/domain/entities/user_extended.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  appStarted() async {
    if (await CustomSharedPreferences.readUser("userdata") != null) {
      emit(const AuthenticationSuccess());
      return;
    }
    emit(AuthenticationFailed());
  }

  loggedIn(ExtendedUser data) async {
    emit(AuthenticationLoading());
    await CustomSharedPreferences.saveUser("userdata", data);
    emit(const AuthenticationSuccess());
  }

  loggedOut() async {
    emit(AuthenticationLoading());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userdata');
    CustomFlasher.showSuccess("Çıxış edildi!");
    emit(AuthenticationFailed());
  }
}
