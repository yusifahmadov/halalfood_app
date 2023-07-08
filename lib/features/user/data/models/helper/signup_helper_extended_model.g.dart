// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_helper_extended_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpExtendedHelperModel _$SignUpExtendedHelperModelFromJson(
        Map<String, dynamic> json) =>
    SignUpExtendedHelperModel(
      dateOfBirth: json['date_of_birth'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phoneNumber: json['phone_number'] as String,
    );

Map<String, dynamic> _$SignUpExtendedHelperModelToJson(
        SignUpExtendedHelperModel instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'date_of_birth': instance.dateOfBirth,
    };
