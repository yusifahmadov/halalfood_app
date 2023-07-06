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
        name: "Food 1",
        description: "Food",
        location: [1, 1],
        image:
            "https://kvomucgmlrykalkgmztb.supabase.co/storage/v1/object/public/images/150479-silhouette_of_trees_near_body_of_water_during_night_time-x350%20(1).jpg",
        createdAt: "2023-07-05T16:29:07.391411+00:00");
  });

  test(
    "ProductModelFromJson should return a model for given json",
    () async {
      final result = ProductModel.fromJson(json[0]);
      expect(model, result);
    },
  );
  test(
    "ProductModelToJson should return a json for given model",
    () async {
      final result = model.toJson();

      expect(result, json[0]);
    },
  );
}
