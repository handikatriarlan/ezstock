import 'package:flutter/widgets.dart';
import 'package:ezstock/utils/number_format_currency.dart';

void formatterPrice(TextEditingController controller) {
  final currentText = controller.text;
  final cursorPosition = controller.selection.base.offset;

  String numericText = currentText.replaceAll(RegExp(r'[^0-9]'), '');

  if (numericText.isEmpty) {
    controller.value = TextEditingValue(
      text: '',
      selection: TextSelection.collapsed(offset: 0),
    );
    return;
  }

  final double parsedValue = double.parse(numericText);
  final formattedText = NumberFormatCurrency.formatCurrencyIdr(parsedValue);

  int newCursorPosition =
      cursorPosition + (formattedText.length - currentText.length);

  if (formattedText != currentText) {
    controller.value = TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(
        offset: newCursorPosition.clamp(0, formattedText.length),
      ),
    );
  }
}
