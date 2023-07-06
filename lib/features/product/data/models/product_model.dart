import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/product.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Product {
  const ProductModel(
      {required super.createdAt,
      required super.description,
      required super.location,
      required super.id,
      required super.name});
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
