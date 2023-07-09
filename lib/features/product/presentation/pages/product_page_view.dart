import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:halalfood/features/product/domain/entities/helper/pagination_params.dart';
import 'package:halalfood/features/product/presentation/cubit/product_cubit.dart';

import '../../../../injection.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';

class ProductPageView extends StatefulWidget {
  const ProductPageView({
    super.key,
  });

  @override
  State<ProductPageView> createState() => _ProductPageViewState();
}

class _ProductPageViewState extends State<ProductPageView> {
  final ProductCubit productCubit = getIt<ProductCubit>();
  @override
  void initState() {
    productCubit.getProducts(PaginationParams());
    super.initState();
  }

  final AuthCubit authCubit = getIt<AuthCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            BlocListener<AuthCubit, AuthState>(
              bloc: authCubit,
              listener: (context, state) {
                if (state is AuthenticationFailed) {
                  context.go('/');
                }
              },
              child: IconButton(
                  onPressed: () {
                    authCubit.loggedOut();
                  },
                  icon: const Icon(
                    Icons.exit_to_app,
                    color: Colors.black,
                  )),
            )
          ],
          elevation: 0,
          title: Text(
            "Məhsullar",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<ProductCubit, ProductState>(
            buildWhen: (previous, current) =>
                previous != current &&
                (current is ProductDataFailed ||
                    current is ProductDataLoading ||
                    current is ProductDataLoaded),
            bloc: productCubit,
            builder: (context, state) {
              if (state is ProductDataLoading) {
                return const Center(
                  child: SizedBox(
                    width: 100,
                    child: LinearProgressIndicator(),
                  ),
                );
              } else if (state is ProductDataFailed) {
                return Center(
                  child: Text(state.message.message),
                );
              } else if (state is ProductDataLoaded) {
                return GridView.builder(
                    itemCount: state.data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 20,
                            crossAxisCount: 2,
                            mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          context.push('/product/${state.data[index].id}',
                              extra: [productCubit, state.data[index].id]);
                        },
                        child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 4,
                                      spreadRadius: 1)
                                ]),
                            child: Column(
                              children: [
                                Image(
                                    image:
                                        NetworkImage(state.data[index].image)),
                                Text(state.data[index].name),
                              ],
                            )),
                      );
                    });
              } else {
                return Container();
              }
            },
          ),
        ));
  }
}
