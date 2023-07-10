part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class SignupSuccess extends UserState {}

class SignupFailed extends UserState {}

class SigninSuccess extends UserState {}

class SigninFailed extends UserState {}

class UserInformationLoaded extends UserState {
  final User data;
  const UserInformationLoaded({required this.data});
}

class UserInformationFailed extends UserState {
  final ResponseI data;
  const UserInformationFailed({required this.data});
}

class UserInformationLoading extends UserState {}
