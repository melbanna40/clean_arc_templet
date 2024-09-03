import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts_app/core/theming/colors.dart';
import 'package:posts_app/core/theming/font_manager.dart';
import 'package:posts_app/core/theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.enabled = true,
    this.length,
    this.keyboardType,
    this.borderRadius,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.style,
    required this.hintText,
    this.isObscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.onChanged,
  });

  final bool enabled;
  final int? length;
  final TextInputType? keyboardType;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final String hintText;
  final bool? isObscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final String? Function(String?) validator;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      maxLength: length,
      keyboardType: keyboardType,
      buildCounter: (
        context, {
        required currentLength,
        required isFocused,
        required maxLength,
      }) =>
          maxLength != null
              ? Text(
                  '$currentLength/$maxLength',
                  style: TextStyles.font16WhiteMedium,
                )
              : const SizedBox.shrink(),
      decoration: InputDecoration(
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
              borderSide: const BorderSide(
                color: ColorManager.textColor,
              ),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
              borderSide: const BorderSide(
                color: ColorManager.textFieldBorderColor,
              ),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          borderSide: const BorderSide(
            color: ColorManager.textFieldBorderErrorColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          borderSide: const BorderSide(
            color: ColorManager.textFieldBorderErrorColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          borderSide: const BorderSide(color: Colors.white),
        ),
        hintStyle: hintStyle ??
            Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontFamily: FontConstants.fontFamily),
        hintText: hintText,

        // label: AnimatedTextKit(
        //   animatedTexts: [
        //     TypewriterAnimatedText(
        //       'Search for any lesson you need.',
        //       textStyle: Theme.of(context)
        //           .textTheme
        //           .labelLarge!
        //           .copyWith(fontFamily: FontConstants.fontFamily),
        //       speed: const Duration(milliseconds: 25),
        //     ),
        //   ],
        //   repeatForever: true,
        // ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ?? ColorManager.textFieldFillColor,
        filled: true,
      ),
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      obscureText: isObscureText ?? false,
      style: style ?? TextStyles.font14DarkBlueMedium,
      validator: validator,
    );
  }
}
