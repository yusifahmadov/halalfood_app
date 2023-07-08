import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:halalfood/core/shared_preferences/custom_shared_preferences.dart';
import 'package:halalfood/features/user/data/models/extended_user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  appStarted() {}
  loggedIn(ExtendedUserModel data) async {
    await CustomSharedPreferences.saveUser("userdata", data);
    emit(const AuthenticationSuccess());
  }
}
