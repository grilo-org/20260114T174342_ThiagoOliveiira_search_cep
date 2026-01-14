import 'package:flutter/services.dart';

class CepInputFormatter extends TextInputFormatter {
  static final _digitsOnly = RegExp(r'\D');

  String _onlyDigits(String input) {
    final digits = input.replaceAll(_digitsOnly, '');
    return digits.length > 8 ? digits.substring(0, 8) : digits;
  }

  String _applyMask(String digits) {
    final len = digits.length;
    if (len <= 5) return digits;
    return '${digits.substring(0, 5)}-${digits.substring(5)}';
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final digits = _onlyDigits(newValue.text);
    final masked = _applyMask(digits);

    return TextEditingValue(text: masked, selection: TextSelection.collapsed(offset: masked.length), composing: TextRange.empty);
  }
}
