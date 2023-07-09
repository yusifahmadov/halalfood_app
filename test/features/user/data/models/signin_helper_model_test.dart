import 'dart:convert';

import 'package:halalfood/features/user/data/models/helper/signin_helper_model.dart';

import '../../../../../custom_test/custom_model_test.dart';
import '../../../../additional/json_reader/json_reader.dart';

void main() {
  const tModel =
      SignInHelperModel(email: 'yusif@gmail.com', password: 'test123');
  testModel('test signin model',
      json: jsonDecode(jsonReader("signin/signin.json")),
      model: tModel,
      fromJson: SignInHelperModel.fromJson,
      toJson: tModel.toJson);
}
