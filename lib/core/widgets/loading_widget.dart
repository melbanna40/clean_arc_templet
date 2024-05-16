import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.size = 100});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const FlutterLogo().animate(
         onPlay: (controller) => controller.repeat(),
      )..fadeIn(duration: 200.milliseconds).fadeOut(duration: 1500.milliseconds),
    );
  }
}
