import 'package:equatable/equatable.dart';

class SignInHelper extends Equatable {
  final String email;
  final String password;

  const SignInHelper({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
