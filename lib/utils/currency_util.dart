import 'package:intl/intl.dart';

String formatCurrency(String amount, String currencyCode) {
  NumberFormat formatter;

  if (currencyCode == 'KHR') {
    formatter = NumberFormat.currency(
      locale: 'km_KH', // Use 'km_KH' for Khmer locale
      decimalDigits: 0, // Set decimalDigits to 0 for KHR without decimal places
      symbol: '',
    );
  } else {
    formatter = NumberFormat.currency(
      locale: 'en_US', // Use 'en_US' for USD format
      symbol: '',
    );
  }

  return formatter
      .format(double.parse(amount.replaceAll(",", "")))
      .replaceAll(",", "");
}
