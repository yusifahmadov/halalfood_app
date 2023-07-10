import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:halalfood/features/user/presentation/utility/border_radius.dart';

class AccountIconBar extends StatelessWidget {
  final String icon;
  final Color? iconColor;

  const AccountIconBar({super.key, required this.icon, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffF7F6F9),
          borderRadius: CustomBorderRadius.radius12()),
      width: 45,
      height: 45,
      child: Center(
          child: SvgPicture.asset(
        "assets/icons/$icon.svg",
        width: 25,
        height: 25,
        color: iconColor,
      )),
    );
  }
}
