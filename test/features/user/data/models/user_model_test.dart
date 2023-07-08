import 'dart:convert';

import 'package:halalfood/features/user/data/models/user_model.dart';

import '../../../../../custom_test/custom_model_test.dart';
import '../../../../additional/json_reader/json_reader.dart';

void main() {
  final tUser = jsonDecode(jsonReader('user/user.json'));

  const tModel = UserModel(
      id: 2,
      name: "Test",
      surname: "Test",
      age: 1,
      phoneNumber: "1",
      email: "1",
      createdAt: "2023-07-06T17:30:08.138404+00:00",
      userId: "ef20986f-35c8-4465-9b85-4c721e299685");
  testModel<UserModel>('userModel json Test',
      json: tUser,
      model: tModel,
      fromJson: UserModel.fromJson,
      toJson: tModel.toJson);
}
