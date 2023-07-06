import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String description;
  final List<num> location;
  @JsonKey(name: 'created_at')
  final String createdAt;

  const Product(
      {required this.createdAt,
      required this.description,
      required this.id,
      required this.location,
      required this.name});

  @override
  List<Object?> get props => [id, location, name, description, createdAt];
}
