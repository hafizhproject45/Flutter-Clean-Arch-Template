import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import '../../../presentation/pages/sales/params.dart';
import '../../utils/utility.dart';

class PrintPreviewHelper {
  static List<String> generateInvoiceLines(
    CashierParams args,
    TextEditingController nameTextController,
    SingleValueDropDownController nameController,
    SingleValueDropDownController typeController,
  ) {
    final customerType = typeController.dropDownValue?.value;
    final customerName =
        customerType == 'MANUAL'
            ? nameTextController.text.trim().isEmpty
                ? '-'
                : nameTextController.text.trim()
            : nameController.dropDownValue?.name ?? '-';

    List<int> arrQty = [];

    String centerText(String text, {int width = 32}) {
      final spaces = ((width - text.length) / 2).floor();
      return ' ' * spaces + text;
    }

    final List<String> lines = [];
    lines.add(centerText("POPY SHOP"));
    lines.add(centerText(""));
    lines.add(centerText("Jl. Pikiran Rakyat, Baleendah,"));
    lines.add(centerText("Kec. Baleendah, Kab. Bandung,"));
    lines.add(centerText("Jawa Barat 40375"));
    lines.add(centerText("Senin-Sabtu | 08.00 - 17.00"));
    lines.add("--------------------------------");
    lines.add("No. Faktur: ${Utility.getInvoiceNumber()}");
    lines.add("Pelanggan: $customerName");
    lines.add(
      "Tanggal: ${Utility.formatDateLocale(DateTime.now().toIso8601String())}",
    );
    lines.add("--------------------------------");
    lines.add(centerText(""));

    for (var entry in args.itemQuantities.entries) {
      final index = entry.key;
      final qty = entry.value;
      final itemName = args.itemNames[index];
      final variants = args.selectedVariants[index] ?? [];
      arrQty.add(qty);

      lines.add('${qty}x $itemName');

      for (final v in variants.where((v) => v.quantity > 0)) {
        final subPrice = v.option.price * v.quantity;
        lines.add(
          "  ${v.quantity}x ${v.option.variantCombo.values.map((v) => v.length > 5 ? v.substring(0, 5) : v).join("/")}",
        );
        lines.add(
          '  @Rp${Utility.formatNumeralMask(v.option.price)} | Rp${Utility.formatNumeralMask(subPrice)}',
        );
      }
    }

    lines.add(centerText(""));
    lines.add("--------------------------------");
    final totalBarang = arrQty.fold(0, (a, b) => a + b);
    final subtotal = args.totalAmount;
    final diskon = 10000;
    final pajak = 0;
    final pembulatan = 0;
    final totalBayar = subtotal + pajak - diskon + pembulatan;

    lines.add(
      "${"TOTAL ITEM".padRight(15)}: ${Utility.formatNumeralMask(totalBarang)} pcs",
    );
    lines.add(
      "${"SUBTOTAL".padRight(15)}: Rp${Utility.formatNumeralMask(subtotal)}",
    );
    lines.add(
      "${"DISKON".padRight(15)}: Rp${Utility.formatNumeralMask(diskon)}",
    );
    lines.add("${"PAJAK".padRight(15)}: Rp${Utility.formatNumeralMask(pajak)}");
    lines.add(
      "${"PEMBULATAN".padRight(15)}: Rp${Utility.formatNumeralMask(pembulatan)}",
    );
    lines.add("--------------------------------");
    lines.add(
      "${"GRAND TOTAL".padRight(15)}: Rp${Utility.formatNumeralMask(totalBayar)}",
    );
    lines.add("");
    lines.add(centerText("~ TERIMA KASIH ~"));
    lines.add("");
    lines.add("");
    lines.add("");

    return lines;
  }

  static void showInvoicePreview(
    BuildContext context,
    CashierParams args,
    TextEditingController nameTextController,
    SingleValueDropDownController nameController,
    SingleValueDropDownController typeController,
  ) {
    final lines = generateInvoiceLines(
      args,
      nameTextController,
      nameController,
      typeController,
    );

    showDialog(
      context: context,
      builder:
          (_) => SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade100,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      lines.join("\n"),
                      style: const TextStyle(
                        fontFamily: 'Courier',
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
