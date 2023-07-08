// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_helper_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpHelperModel _$SignUpHelperModelFromJson(Map<String, dynamic> json) =>
    SignUpHelperModel(
      email: json['email'] as String,
      password: json['password'] as String,
      data: SignUpExtendedHelperModel.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpHelperModelToJson(SignUpHelperModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'data': instance.data,
    };
