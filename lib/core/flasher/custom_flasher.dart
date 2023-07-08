import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:halalfood/injection.dart';

import '../constant/constants.dart';

class CustomFlasher {
  static Future<void> showError(String? text, {onTap}) async {
    showFlash(
        context: mainContext!,
        duration: const Duration(seconds: 4),
        builder: (_, controller) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Flash(
              key: const Key("failFlash"),
              dismissDirections: const [FlashDismissDirection.vertical],
              position: FlashPosition.top,
              controller: controller,
              child: IntrinsicWidth(
                child: FlashBar(
                  behavior: FlashBehavior.floating,
                  position: FlashPosition.top,
                  dismissDirections: const [FlashDismissDirection.vertical],
                  backgroundColor: const Color(0xffdc3545),
                  content: Text(
                    text != null
                        ? text
                            .replaceAll("{", "")
                            .replaceAll("}", "")
                            .replaceAll("detail", "Xəta mesajı")
                        : "Xəta baş verdi!",
                    style: Theme.of(mainContext!)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                  controller: controller,
                ),
              ),
            ),
          );
        });
  }

  static void showSuccess(String? text, {onTap, context}) {
    showFlash(
        context: context ?? mainContext!,
        duration: const Duration(seconds: 4),
        builder: (_, controller) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Flash(
              key: const Key("successFlash"),
              dismissDirections: const [FlashDismissDirection.vertical],
              controller: controller,
              child: IntrinsicWidth(
                child: FlashBar(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  behavior: FlashBehavior.floating,
                  position: FlashPosition.top,
                  dismissDirections: const [FlashDismissDirection.vertical],
                  backgroundColor: greenColor,
                  content: Text(
                    text ?? "Əməliyyat icra olundu!",
                    style: Theme.of(mainContext!)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                  controller: controller,
                ),
              ),
            ),
          );
        });
  }
}
