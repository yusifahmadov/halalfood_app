import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/helper/signup_extended_helper.dart';
part 'signup_helper_extended_model.g.dart';

@JsonSerializable()
class SignUpExtendedHelperModel extends SignUpExtendedHelper {
  SignUpExtendedHelperModel(
      {required super.dateOfBirth,
      required super.firstName,
      required super.lastName,
      required super.phoneNumber});

  factory SignUpExtendedHelperModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpExtendedHelperModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpExtendedHelperModelToJson(this);
}
