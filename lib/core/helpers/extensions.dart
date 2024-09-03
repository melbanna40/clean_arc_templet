import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DecimalTextInputFormatter extends TextInputFormatter {

  DecimalTextInputFormatter({
    required int decimalRange,
    required bool activatedNegativeValues,
  }) : assert(
          decimalRange >= 0,
          'DecimalTextInputFormatter declaration error',
        ) {
    final dp = (decimalRange > 0) ? '([.][0-9]{0,$decimalRange}){0,1}' : '';
    final num = '[0-9]*$dp';

    if (activatedNegativeValues) {
      _exp = RegExp('^((((-){0,1})|((-){0,1}[0-9]$num))){0,1}\$');
    } else {
      _exp = RegExp('^($num){0,1}\$');
    }
  }
  RegExp? _exp;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (_exp!.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}

extension StringExtensions on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension FormatDuration on Duration {
  String format() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }
}

extension GetHexColor on String {
  Color hexColor(String color) {
    try {
      var hexColor = color.toUpperCase().replaceAll('#', '');
      if (hexColor.length == 6) {
        hexColor = '0xFF$hexColor';
      }
      return Color(int.parse(hexColor));
    } catch (e) {
      return Colors.transparent;
    }
  }
}
