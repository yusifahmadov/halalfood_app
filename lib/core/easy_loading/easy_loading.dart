import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:halalfood/core/constant/constants.dart';

import 'custom_animation.dart';

class EasyLoad {
  static init() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 15.0
      ..progressColor = appMainColor
      ..backgroundColor = Colors.white
      ..indicatorColor = appMainColor
      ..textColor = Colors.yellow
      ..maskColor = Colors.black.withOpacity(0.6)
      ..userInteractions = false
      ..lineWidth = 2
      ..dismissOnTap = false
      ..customAnimation = CustomAnimation();
  }

  static show() {
    EasyLoading.show(
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.custom,
    );
  }

  static dismiss() {
    EasyLoading.dismiss();
  }
}
