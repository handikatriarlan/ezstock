import 'package:intl/intl.dart';

class NumberFormatCurrency {
  static String formatCurrencyIdr(double amount) {
    final NumberFormat currencyFormat = NumberFormat.currency(
        locale: 'id_ID', symbol: 'Rp. ', decimalDigits: 0);
    return currencyFormat.format(amount);
  }

  static String formatCurrencyIdrWithoutSymbol(double amount) {
    final NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0);
    return currencyFormat.format(amount).trim();
  }
}
