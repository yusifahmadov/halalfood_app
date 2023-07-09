import 'package:halalfood/features/user/domain/entities/helper/signin_helper.dart';
import 'package:json_annotation/json_annotation.dart';
part 'signin_helper_model.g.dart';

@JsonSerializable()
class SignInHelperModel extends SignInHelper {
  const SignInHelperModel({required super.email, required super.password});

  factory SignInHelperModel.fromJson(Map<String, dynamic> json) =>
      _$SignInHelperModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignInHelperModelToJson(this);
}
