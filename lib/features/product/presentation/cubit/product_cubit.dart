import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:halalfood/features/product/domain/entities/helper/pagination_params.dart';
import 'package:halalfood/features/product/domain/usecases/get_one_product_usecase.dart';
import 'package:halalfood/features/product/domain/usecases/get_product_usecase.dart';

import '../../../../core/error/response.dart';
import '../../domain/entities/product.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  GetProductUseCase getProductUseCase;
  GetOneProductUseCase getOneProductUseCase;
  ProductCubit(
      {required this.getProductUseCase, required this.getOneProductUseCase})
      : super(ProductInitial());

  getProducts(PaginationParams params) async {
    emit(ProductDataLoading());
    final response = await getProductUseCase(params);
    response.fold((l) => emit(ProductDataFailed(message: l)),
        (r) => emit(ProductDataLoaded(data: r)));
  }

  getOneProduct(int id) async {
    emit(OneProductDataLoading());
    final response = await getOneProductUseCase(id);
    response.fold((l) => emit(OneProductDataFailed(message: l)),
        (r) => emit(OneProductDataLoaded(data: r)));
  }
}
