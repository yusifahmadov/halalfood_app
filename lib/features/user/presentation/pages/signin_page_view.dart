import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:halalfood/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:halalfood/features/main/presentation/utility/custom_input_decoration.dart';
import 'package:halalfood/features/main/presentation/widgets/custom_button.dart';
import 'package:halalfood/features/main/presentation/widgets/custom_text_field.dart';
import 'package:halalfood/features/user/data/models/helper/signin_helper_model.dart';
import 'package:halalfood/features/user/presentation/cubit/user_cubit.dart';

import '../../../../injection.dart';
import '../widgets/app_bar.dart';

class SignInPageView extends StatefulWidget {
  final AuthCubit authCubit;
  const SignInPageView({super.key, required this.authCubit});

  @override
  State<SignInPageView> createState() => _SignInPageViewState();
}

class _SignInPageViewState extends State<SignInPageView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final userCubit = getIt<UserCubit>();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();

    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomReturnAppBar(title: "Giriş"),
      body: BlocListener<AuthCubit, AuthState>(
        bloc: widget.authCubit,
        listener: (context, state) {
          if (state is AuthenticationSuccess) {
            context.go('/home', extra: widget.authCubit);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                    validatorF: (value) {
                      if (value == "") {
                        return 'Boş buraxıla bilməz!';
                      }
                      if (!RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(value!)) {
                        return "Düzgün email daxil edilməyib!";
                      }
                      return null;
                    },
                    controller: emailController,
                    decoration: CustomInputDecoration(
                        context: context, hintText: "Email"),
                    context: context),
                const SizedBox(
                  height: 20,
                ),
                StreamBuilder<bool>(
                    stream: userCubit.signInPasswordStream,
                    initialData: true,
                    builder: (context, snapshot) {
                      return CustomTextField(
                          validatorF: (value) {
                            if (value == "") {
                              return 'Boş buraxıla bilməz!';
                            }

                            return null;
                          },
                          controller: passwordController,
                          obscureText: snapshot.data,
                          decoration: CustomInputDecoration(
                              obscureChecker: true,
                              obscured: snapshot.data,
                              onObscureChange: () async {
                                userCubit.updateSigninPasswordControllerValue(
                                    !snapshot.data!);
                              },
                              context: context,
                              hintText: "Şifrə"),
                          context: context);
                    }),
                const SizedBox(
                  height: 20,
                ),
                CustomTextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      userCubit.signIn(
                          helper: SignInHelperModel(
                              email: emailController.text,
                              password: passwordController.text),
                          authCubit: widget.authCubit);
                    }
                  },
                  text: "Giriş et",
                  maxSize: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
