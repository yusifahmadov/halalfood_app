import 'package:equatable/equatable.dart';
import 'package:halalfood/features/user/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

class ExtendedUser extends Equatable {
  @JsonKey(name: "access_token")
  final String accessToken;
  @JsonKey(name: "refresh_token")
  final String refreshToken;
  final UserModel user;

  const ExtendedUser(
      {required this.accessToken,
      required this.refreshToken,
      required this.user});

  @override
  List<Object?> get props => [user, accessToken, refreshToken];
}
