import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:halalfood/core/constant/constants.dart';
import 'package:halalfood/features/main/presentation/widgets/custom_button.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                context.go('/signup');
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
                Text(
                  "Giriş et",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: appMainColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
