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

extension NumDurationExtensions on num {
  Duration get microseconds => Duration(microseconds: round());

  Duration get ms => (this * 1000).microseconds;

  Duration get milliseconds => (this * 1000).microseconds;

  Duration get seconds => (this * 1000 * 1000).microseconds;

  Duration get minutes => (this * 1000 * 1000 * 60).microseconds;

  Duration get hours => (this * 1000 * 1000 * 60 * 60).microseconds;

  Duration get days => (this * 1000 * 1000 * 60 * 60 * 24).microseconds;
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
