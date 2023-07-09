import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/constants.dart';
import '../../../../injection.dart';
import '../cubit/auth_cubit.dart';
import '../../../main/presentation/widgets/custom_button.dart';

class AuthPageView extends StatelessWidget {
  AuthPageView({super.key});
  final authCubit = getIt<AuthCubit>();

  @override
  Widget build(BuildContext context) {
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
              context.push('/auth/signup', extra: authCubit);
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
                  context.push('/auth/signin', extra: authCubit);
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
  }
}
