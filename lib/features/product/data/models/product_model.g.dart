// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      createdAt: json['created_at'] as String,
      description: json['description'] as String,
      location:
          (json['location'] as List<dynamic>).map((e) => e as num).toList(),
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'location': instance.location,
      'created_at': instance.createdAt,
    };
