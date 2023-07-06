import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:halalfood/features/user/domain/entities/helper/signup_helper.dart';
import 'package:halalfood/features/user/domain/usecases/signup_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  SignupUseCase signupUseCase;
  UserCubit({required this.signupUseCase}) : super(UserInitial());

  signUp(SignupHelper helper) async {
    final response = await signupUseCase(helper);
    response.fold((l) {
      print(l);
    }, (r) {
      print(r);
    });
  }
}
