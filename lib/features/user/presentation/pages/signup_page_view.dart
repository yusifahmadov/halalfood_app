import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:halalfood/features/main/presentation/utility/custom_input_decoration.dart';
import 'package:halalfood/features/main/presentation/widgets/custom_button.dart';
import 'package:halalfood/features/main/presentation/widgets/custom_text_field.dart';
import 'package:halalfood/features/user/data/models/helper/signup_helper_extended_model.dart';
import 'package:halalfood/features/user/presentation/cubit/user_cubit.dart';

import 'package:intl/intl.dart';

import '../../../../core/constant/constants.dart';
import '../../../../injection.dart';
import '../../data/models/helper/signup_helper_model.dart';

class SignupPageView extends StatefulWidget {
  const SignupPageView({super.key});

  @override
  State<SignupPageView> createState() => _SignupPageViewState();
}

class _SignupPageViewState extends State<SignupPageView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final againPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final UserCubit userCubit = getIt<UserCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: BlocListener<UserCubit, UserState>(
        listenWhen: (previous, current) =>
            previous != current && (current is SignupSuccess),
        bloc: userCubit,
        listener: (context, state) {
          if (state is SignupSuccess) {
            context.go('/products');
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _emailField(context),
                const SizedBox(
                  height: 20,
                ),
                _nameField(context),
                const SizedBox(
                  height: 20,
                ),
                _surnameField(context),
                const SizedBox(
                  height: 20,
                ),
                _phoneNumberField(context),
                const SizedBox(
                  height: 20,
                ),
                _ageField(context),
                const SizedBox(
                  height: 20,
                ),
                _passwordField(context),
                const SizedBox(
                  height: 20,
                ),
                _againPasswordField(),
                const SizedBox(
                  height: 20,
                ),
                _signUpButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  CustomTextField _ageField(BuildContext context) {
    return CustomTextField(
        key: const Key("ageField"),
        validatorF: (value) {
          if (value == "") {
            return 'Boş buraxıla bilməz';
          }
          if (value!.length != 10) {
            return 'Doğum tarixi tam daxil edilməyib!';
          }
          return null;
        },
        context: context,
        controller: ageController,
        ageInputType: true,
        decoration: CustomInputDecoration(
          context: context,
          suffixIconOnTap: () async {
            final dateTime = await showDatePicker(
                context: context,
                initialDate: DateTime(
                    DateTime.now().subtract(const Duration(days: 8 * 365)).year,
                    1,
                    1),
                firstDate: DateTime(1000, 10, 10),
                lastDate:
                    DateTime.now().subtract(const Duration(days: 8 * 365)));
            if (dateTime != null) {
              ageController.text = DateFormat("dd.MM.yyyy").format(dateTime);
            }
          },
          suffixIcon: "calendar-outline",
          hintText: "Doğum tarixi*",
        ));
  }

  CustomTextField _phoneNumberField(BuildContext context) {
    return CustomTextField(
        key: const Key("phoneNumberField"),
        validatorF: (value) {
          if (value == "") {
            return 'Boş buraxıla bilməz';
          }
          if (value!.length != 12) {
            return 'Nömrə tam daxil edilməyib!';
          }
          return null;
        },
        context: context,
        controller: phoneNumberController,
        numberInputType: true,
        decoration: CustomInputDecoration(
          context: context,
          prefixText: "+994",
          hintText: "Mobil nömrə*",
        ));
  }

  CustomTextField _surnameField(BuildContext context) {
    return CustomTextField(
        key: const Key("surnameField"),
        validatorF: (value) {
          if (value == "") {
            return 'Boş buraxıla bilməz';
          }
          return null;
        },
        context: context,
        controller: surnameController,
        decoration: CustomInputDecoration(
          context: context,
          hintText: "Soyad*",
        ));
  }

  CustomTextField _nameField(BuildContext context) {
    return CustomTextField(
        key: const Key("nameField"),
        validatorF: (value) {
          if (value == "") {
            return 'Boş buraxıla bilməz';
          }

          return null;
        },
        context: context,
        controller: nameController,
        decoration: CustomInputDecoration(
          context: context,
          hintText: "Ad*",
        ));
  }

  StreamBuilder<bool> _againPasswordField() {
    return StreamBuilder<bool>(
        stream: userCubit.signUpAgainPasswordStream,
        initialData: true,
        builder: (context, snapshot) {
          return CustomTextField(
              key: const Key("passwordAgainField"),
              context: context,
              validatorF: (value) {
                if (value == "") {
                  return 'Boş buraxıla bilməz';
                }
                return null;
              },
              obscureText: snapshot.data,
              controller: againPasswordController,
              decoration: CustomInputDecoration(
                obscureChecker: true,
                obscured: snapshot.data,
                onObscureChange: () async {
                  userCubit.updateSignupAgainPasswordControllerValue(
                      !snapshot.data!);
                },
                context: context,
                hintText: "Təkrar şifrə*",
              ));
        });
  }

  CustomTextButton _signUpButton() {
    return CustomTextButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          userCubit.signUp(
            helper: SignUpHelperModel(
                email: emailController.text,
                password: passwordController.text,
                data: SignUpExtendedHelperModel(
                    dateOfBirth: ageController.text,
                    firstName: nameController.text,
                    lastName: surnameController.text,
                    phoneNumber: "+994-${phoneNumberController.text}")),
          );
        }
      },
      text: "Qeydiyyat ol",
      maxSize: true,
    );
  }

  StreamBuilder _passwordField(BuildContext context) {
    return StreamBuilder<bool>(
        stream: userCubit.signUpPasswordStream,
        builder: (context, snapshot) {
          return CustomTextField(
              key: const Key("passwordField"),
              context: context,
              validatorF: (value) {
                if (value == "") {
                  return 'Boş buraxıla bilməz';
                }
                return null;
              },
              obscureText: snapshot.data,
              controller: passwordController,
              decoration: CustomInputDecoration(
                obscureChecker: true,
                obscured: snapshot.data,
                onObscureChange: () async {
                  userCubit
                      .updateSignupPasswordControllerValue(!snapshot.data!);
                },
                context: context,
                hintText: "Şifrə*",
              ));
        });
  }

  CustomTextField _emailField(BuildContext context) {
    return CustomTextField(
        key: const Key("emailField"),
        validatorF: (value) {
          if (value == "") {
            return 'Boş buraxıla bilməz';
          }
          if (!RegExp(
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(value!)) {
            return "Düzgün email daxil edilməyib!";
          }
          return null;
        },
        context: context,
        controller: emailController,
        decoration: CustomInputDecoration(
          context: context,
          hintText: "Email*",
        ));
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      leadingWidth: 70,
      title: Text(
        "Qeydiyyat",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 17),
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.arrow_back_ios_new, color: appMainColor),
            Text(
              "Geri",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: appMainColor),
            )
          ],
        ),
      ),
    );
  }
}
