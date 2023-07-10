import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:halalfood/core/constant/constants.dart';
import 'package:halalfood/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:halalfood/features/user/presentation/cubit/user_cubit.dart';
import 'package:halalfood/features/user/presentation/widgets/account_bar.dart';
import 'package:intl/intl.dart';

import '../../../../injection.dart';

class AccountPageView extends StatefulWidget {
  const AccountPageView({super.key});

  @override
  State<AccountPageView> createState() => _AccountPageViewState();
}

class _AccountPageViewState extends State<AccountPageView> {
  final AuthCubit authCubit = getIt<AuthCubit>();
  final UserCubit userCubit = getIt<UserCubit>();
  @override
  void initState() {
    userCubit.getUserInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF8F9FD),
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16))),
                    child: Stack(
                      children: [_backGroundImage(), _userInformation()],
                    ))),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                flex: 3,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16))),
                  child: _accountBars(),
                ))
          ],
        ));
  }

  Padding _accountBars() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AccountBar(
                onTap: () async {},
                icon: 'settings-outline',
                text: "Parametrlər"),
            const SizedBox(
              height: 20,
            ),
            AccountBar(
                onTap: () async {},
                icon: 'person-outline',
                text: "İstifadəçi məlumatları"),
            const SizedBox(
              height: 20,
            ),
            BlocListener<AuthCubit, AuthState>(
                bloc: authCubit,
                listener: (context, state) {
                  if (state is AuthenticationFailed) {
                    context.go('/');
                  }
                },
                child: AccountBar(
                  onTap: () async {
                    authCubit.loggedOut();
                  },
                  icon: 'log-out-outline',
                  text: "Çıxış",
                  textColor: redColor,
                  iconColor: redColor,
                )),
          ],
        ),
      ),
    );
  }

  Positioned _userInformation() {
    return Positioned.fill(
      top: 55,
      child: BlocBuilder<UserCubit, UserState>(
        bloc: userCubit,
        builder: (context, state) {
          if (state is UserInformationFailed) {
            return Center(
              child: Text(state.data.message),
            );
          } else if (state is UserInformationLoaded) {
            return Column(
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.transparent,
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/add-image.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Text(
                  "${state.data.name} ${state.data.surname}",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "İstifadəçi",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "|",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${DateFormat('dd MMMM yyyy', 'az').format(DateTime.parse(state.data.createdAt))} qatılıb',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                )
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Container _backGroundImage() {
    return Container(
        height: 150,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage("assets/account-back.jpg")),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          ),
        ));
  }
}
