part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductDataLoading extends ProductState {}

class ProductDataLoaded extends ProductState {
  final List<Product> data;
  const ProductDataLoaded({required this.data});
}

class ProductDataFailed extends ProductState {
  final ResponseI message;
  const ProductDataFailed({required this.message});
}

class OneProductDataLoading extends ProductState {}

class OneProductDataLoaded extends ProductState {
  final List<Product> data;
  const OneProductDataLoaded({required this.data});
}

class OneProductDataFailed extends ProductState {
  final ResponseI message;
  const OneProductDataFailed({required this.message});
}
