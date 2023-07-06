import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:halalfood/features/product/data/models/product_model.dart';

import '../../../../additional/json_reader/json_reader.dart';

void main() {
  late ProductModel model;
  final json = jsonDecode(jsonReader('product/product.json'));
  setUp(() {
    model = const ProductModel(
        id: 1,
        name: "Test",
        description: "Test",
        location: [1, 1],
        createdAt: "");
  });

  test(
    "ProductModelFromJson should return a model for given json",
    () async {
      final result = ProductModel.fromJson(json);
      expect(model, result);
    },
  );
  test(
    "ProductModelToJson should return a json for given model",
    () async {
      final result = model.toJson();
      expect(result, json);
    },
  );
}
