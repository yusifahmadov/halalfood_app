import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:halalfood/features/product/domain/entities/helper/pagination_params.dart';
import 'package:halalfood/features/product/domain/usecases/get_product_usecase.dart';

import '../../../../core/error/response.dart';
import '../../domain/entities/product.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  GetProductUseCase getProductUseCase;
  ProductCubit({required this.getProductUseCase}) : super(ProductInitial());

  getProducts(PaginationParams params) async {
    emit(ProductDataLoading());
    final response = await getProductUseCase(params);
    response.fold((l) => emit(ProductDataFailed(message: l)),
        (r) => emit(ProductDataLoaded(data: r)));
  }
}
