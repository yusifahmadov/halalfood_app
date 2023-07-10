import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class User extends Equatable {
  final dynamic id;
  final String? name;
  final String? surname;
  final String email;
  @JsonKey(name: "phone_number")
  final String? phoneNumber;
  final int? age;
  @JsonKey(name: "user_id")
  final String? userId;
  @JsonKey(name: "created_at")
  final String createdAt;

  const User(
      {required this.age,
      required this.email,
      required this.createdAt,
      required this.userId,
      required this.id,
      required this.name,
      required this.phoneNumber,
      required this.surname});

  @override
  List<Object?> get props => [
        id,
        age,
        email,
        name,
        phoneNumber,
        surname,
        createdAt,
        userId,
      ];
}
