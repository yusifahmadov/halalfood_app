import 'package:halalfood/features/user/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user_extended.dart';
part 'extended_user_model.g.dart';

@JsonSerializable()
class ExtendedUserModel extends ExtendedUser {
  ExtendedUserModel({
    required super.accessToken,
    required super.user,
    required super.refreshToken,
  });
  factory ExtendedUserModel.fromJson(Map<String, dynamic> json) =>
      _$ExtendedUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExtendedUserModelToJson(this);
}
