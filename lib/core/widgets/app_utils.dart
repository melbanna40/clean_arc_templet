import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gap/gap.dart';
import 'package:posts_app/core/theming/colors.dart';
import 'package:posts_app/generated/assets.dart';

void showAlertDialog(
  BuildContext context, {
  required String title,
  required String message,
  String positiveButton = 'OK',
  String negativeButton = 'OK',
  required Function positiveButtonClick,
  Function? negativeButtonClick,
  bool isFailed = false,
}) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Column(
        children: [
          SvgPicture.asset(
            isFailed ? Assets.svgIcErrorAlert : Assets.svgIcSucessAlert,
          ),
          4.verticalSpace,
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isFailed
                  ? ColorManager.textErrorColorDialog
                  : ColorManager.textSuccessColorDialog,
              fontSize: 16,
              fontFamily: 'Proxima Nova',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xFF25262A),
          fontSize: 14,
          fontFamily: 'Proxima Nova',
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: <CupertinoDialogAction>[
        if (negativeButtonClick != null)
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            onPressed: () {
              Navigator.pop(context);
              negativeButtonClick.call();
            },
            child: Text(negativeButton),
          ),
        CupertinoDialogAction(
          /// This parameter indicates the action would perform
          /// a destructive action such as deletion, and turns
          /// the action's text color to red.
          isDestructiveAction: isFailed,
          onPressed: () {
            Navigator.pop(context);
            positiveButtonClick.call();
          },
          child: Text(positiveButton),
        ),
      ],
    ),
  );
}
