
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts_app/core/theming/colors.dart';
import 'package:posts_app/core/theming/font_manager.dart';

class TextStyles {
  static TextStyle font28BlackBold = TextStyle(
    fontSize: 28.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.bold,
    color: ColorManager.textColor,
  );

  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.bold,
    color: ColorManager.textColor,
  );
  static TextStyle font20BlackRegular = TextStyle(
    fontSize: 20.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.regular,
    color: ColorManager.textColor,
  );
  static TextStyle font20BlackSemiBold = TextStyle(
    fontSize: 20.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.semiBold,
    color: ColorManager.textColor,
  );
  static TextStyle font20BlackBold = TextStyle(
    fontSize: 20.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.bold,
    color: ColorManager.textColor,
  );

  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.bold,
    color: ColorManager.mainBlue,
  );

  static TextStyle font13BlueSemiBold = TextStyle(
    fontSize: 13.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.semiBold,
    color: ColorManager.mainBlue,
  );

  static TextStyle font13DarkBlueMedium = TextStyle(
    fontSize: 13.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.medium,
    color: ColorManager.darkBlue,
  );

  static TextStyle font13DarkBlueRegular = TextStyle(
    fontSize: 13.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.regular,
    color: ColorManager.darkBlue,
  );

  static TextStyle font24BlueBold = TextStyle(
    fontSize: 24.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.bold,
    color: ColorManager.mainBlue,
  );

  static TextStyle font13GrayRegular = TextStyle(
    fontSize: 13.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.regular,
    color: ColorManager.gray,
  );

  static TextStyle font13BlueRegular = TextStyle(
    fontSize: 13.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.regular,
    color: ColorManager.mainBlue,
  );

  static TextStyle font10WhiteSemiBold = TextStyle(
    fontSize: 10.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.semiBold,
    color: Colors.white,
  );
  static TextStyle font12TextRegular = TextStyle(
    fontSize: 12.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.regular,
    color: ColorManager.textColor,
  );

  static TextStyle font14GrayRegular = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.regular,
    color: ColorManager.gray,
  );

  static TextStyle font14LightGrayRegular = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.regular,
    color: ColorManager.lightGray,
  );

  static TextStyle font14DarkBlueMedium = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.medium,
    color: ColorManager.darkBlue,
  );
  static TextStyle font14BlueSemiBold = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.semiBold,
    color: ColorManager.mainBlue,
  );
  static TextStyle font16WhiteMedium = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.medium,
    color: Colors.white,
  );

  static TextStyle font16BlackMedium = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.medium,
    color: ColorManager.textColor,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.semiBold,
    color: Colors.white,
  );
  static TextStyle font16TextSemiBold = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.semiBold,
    color: ColorManager.textColor,
  );
  static TextStyle font16WhiteBold = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.bold,
    color: Colors.white,
  );
  static TextStyle font16TextBold = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.bold,
    color: ColorManager.textColor,
  );

  static TextStyle font15DarkBlueMedium = TextStyle(
    fontSize: 15.sp,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeightManager.medium,
    color: ColorManager.darkBlue,
  );
}

InputDecoration appTextFormFieldStyle(
  BuildContext context, {
  String? hint,
  Widget? prefixIcon,
  Widget? suffixIcon,
}) =>
    InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: ColorManager.textColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: ColorManager.textFieldBorderColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: ColorManager.textFieldBorderErrorColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: ColorManager.textFieldBorderErrorColor,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.white),
      ),
      hintStyle: Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(fontFamily: FontConstants.fontFamily),
      hintText: hint,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      fillColor: ColorManager.textFieldFillColor,
      filled: true,
    );

RichText getRequiredLabel(String fieldName) {
  return RichText(
    text: TextSpan(
      style: const TextStyle(
        fontSize: 16,
        color: ColorManager.textColor,
        fontFamily: FontConstants.fontFamily,
      ),
      text: fieldName,
      children: const [
        TextSpan(text: '*', style: TextStyle(color: Colors.red)),
      ],
    ),
  );
}
