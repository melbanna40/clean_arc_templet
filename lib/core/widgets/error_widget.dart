import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:posts_app/core/theming/colors.dart';
import 'package:posts_app/core/theming/font_manager.dart';

class FailedWidget extends StatelessWidget {
  const FailedWidget({super.key, this.failedMessage, this.callback});

  final String? failedMessage;
  final void Function()? callback;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const FlutterLogo(
            size: 150,
          ),
          // SvgPicture.asset(
          //   Assets.svgLoadingLogo,
          //   height: 150,
          // ),
          Text(
            failedMessage ?? 'no_content'.tr(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: FontConstants.fontFamily,
            ),
          ),
          if (callback != null)
            IconButton(
              onPressed: () => callback?.call(),
              icon: const Icon(Icons.refresh, color: ColorManager.darkPrimary),
            ),
        ],
      ),
    );
  }
}
