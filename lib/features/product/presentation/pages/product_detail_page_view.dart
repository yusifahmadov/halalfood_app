import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halalfood/features/product/presentation/cubit/product_cubit.dart';

class ProductDetailPageView extends StatefulWidget {
  const ProductDetailPageView(
      {super.key, required this.cubit, required this.id});
  final ProductCubit cubit;
  final int id;

  @override
  State<ProductDetailPageView> createState() => _ProductDetailPageViewState();
}

class _ProductDetailPageViewState extends State<ProductDetailPageView> {
  @override
  void initState() {
    widget.cubit.getOneProduct(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        bloc: widget.cubit,
        buildWhen: (previous, current) =>
            previous != current &&
            (current is OneProductDataFailed ||
                current is OneProductDataLoading ||
                current is OneProductDataLoaded),
        builder: (context, state) {
          if (state is OneProductDataLoading) {
            return const Center(
              child: SizedBox(
                width: 100,
                child: LinearProgressIndicator(),
              ),
            );
          } else if (state is OneProductDataFailed) {
            return Center(
              child: Text(state.message.message),
            );
          } else if (state is OneProductDataLoaded) {
            return Center(
              child: Text(state.data[0].name),
            );
          }
          return Container();
        },
      ),
    );
  }
}
