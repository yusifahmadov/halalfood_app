// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      age: json['age'] as int?,
      email: json['email'] as String,
      id: json['id'],
      name: json['name'] as String?,
      createdAt: json['created_at'] as String,
      userId: json['user_id'] as String?,
      phoneNumber: json['phone_number'] as String?,
      surname: json['surname'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'age': instance.age,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
    };
