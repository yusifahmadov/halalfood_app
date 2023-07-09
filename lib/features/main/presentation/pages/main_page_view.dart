import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:halalfood/core/constant/constants.dart';
import 'package:halalfood/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:halalfood/features/main/presentation/widgets/custom_button.dart';
import 'package:halalfood/features/product/presentation/pages/product_page_view.dart';

import '../../../../injection.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  @override
  void initState() {
    authCubit.appStarted();
    super.initState();
  }

  final authCubit = getIt<AuthCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        bloc: authCubit,
        buildWhen: (previous, current) =>
            previous != current &&
            (current is AuthenticationLoading ||
                current is AuthenticationFailed ||
                current is AuthenticationSuccess),
        listener: (context, state) {
          if (state is AuthenticationFailed) {
            context.go('/', extra: authCubit);
          }
        },
        builder: (context, state) {
          if (state is AuthenticationFailed) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    "Halal Gida",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: appMainColor, fontSize: 28),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextButton(
                    onPressed: () async {
                      context.go('/signup', extra: authCubit);
                    },
                    text: "Qeydiyyat ol",
                    maxSize: true,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Hesabın var?"),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.go('/signin', extra: authCubit);
                        },
                        child: Text(
                          "Giriş et",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: appMainColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          } else if (state is AuthenticationSuccess) {
            return ProductPageView(
              authCubit: authCubit,
            );
          }
          return Container();
        },
      ),
    );
  }
}
