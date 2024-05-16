import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:posts_app/core/theming/colors.dart';

class EasyLoadingConfig {
  static void configLoading() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorType = EasyLoadingIndicatorType.pulse
      ..indicatorSize = 80
      ..indicatorColor = ColorManager.primary
      ..contentPadding = const EdgeInsets.all(12)
      ..displayDuration = const Duration(milliseconds: 700)
      ..animationDuration = const Duration(milliseconds: 700)
      ..radius = 10.0
      ..progressColor = ColorManager.primary
      ..backgroundColor = Colors.white
      ..textColor = Colors.black
      ..maskColor = ColorManager.primary
      ..maskType = EasyLoadingMaskType.clear
      ..userInteractions = false
      ..dismissOnTap = false;
  }
}
