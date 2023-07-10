import 'package:flutter/material.dart';
import 'package:halalfood/features/user/presentation/widgets/account_icon_bar.dart';

class AccountBar extends StatelessWidget {
  final String icon;
  final String text;
  final Color? textColor;
  final Color? iconColor;
  final void Function()? onTap;
  const AccountBar(
      {super.key,
      required this.icon,
      required this.text,
      required this.onTap,
      this.textColor,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          AccountIconBar(
            icon: icon,
            iconColor: iconColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 16, color: textColor),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: iconColor,
            size: 19,
          )
        ],
      ),
    );
  }
}
