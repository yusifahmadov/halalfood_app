import 'package:flutter/material.dart';

import '../../../../core/constant/constants.dart';

class CustomReturnAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  const CustomReturnAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return _appBar(context: context, title: title);
  }

  AppBar _appBar({required BuildContext context, required String title}) {
    return AppBar(
      elevation: 0,
      leadingWidth: 70,
      title: Text(
        title,
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

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
