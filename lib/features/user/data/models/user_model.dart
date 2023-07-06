import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel(
      {required super.age,
      required super.email,
      required super.id,
      required super.name,
      required super.createdAt,
      required super.userId,
      required super.phoneNumber,
      required super.surname});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
