class CepFormatter {
  static String sanitize(String value) {
    return value.replaceAll(RegExp(r'[^0-9]'), '');
  }

  static String format(String value) {
    final digits = sanitize(value);
    if (digits.length != 8) return value;

    return '${digits.substring(0, 5)}-${digits.substring(5)}';
  }
}
