// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extended_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtendedUserModel _$ExtendedUserModelFromJson(Map<String, dynamic> json) =>
    ExtendedUserModel(
      accessToken: json['access_token'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$ExtendedUserModelToJson(ExtendedUserModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'user': instance.user,
    };
