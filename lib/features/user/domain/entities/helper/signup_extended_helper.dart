import 'package:json_annotation/json_annotation.dart';

class SignUpExtendedHelper {
  @JsonKey(name: "first_name")
  String firstName;
  @JsonKey(name: "last_name")
  String lastName;
  @JsonKey(name: "phone_number")
  String phoneNumber;
  @JsonKey(name: "date_of_birth")
  String dateOfBirth;

  SignUpExtendedHelper(
      {required this.dateOfBirth,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber});
}
