import 'package:halalfood/features/user/data/models/helper/signup_helper_extended_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/helper/signup_helper.dart';
part 'signup_helper_model.g.dart';

@JsonSerializable()
class SignUpHelperModel extends SignUpHelper {
  SignUpHelperModel(
      {required super.email, required super.password, required super.data});
  factory SignUpHelperModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpHelperModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpHelperModelToJson(this);
}
