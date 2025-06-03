import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

import '../../../presentation/pages/sales/params.dart';
import '../../utils/toast.dart';
import '../../utils/utility.dart';

class PrintExecuteHelper {
  static String? selectedPrinterAddress;
  static String selectedPrinterName = 'Unknown';

  static String generateInvoiceText(
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

    final arrQty = <int>[];

    String centerText(String text, {int width = 32}) {
      final spaces = ((width - text.length) / 2).floor();
      return ' ' * spaces + text;
    }

    final buffer = StringBuffer();
    buffer.writeln(centerText("POPY SHOP"));
    buffer.writeln(centerText(""));
    buffer.writeln(centerText("Jl. Pikiran Rakyat, Baleendah,"));
    buffer.writeln(centerText("Kec. Baleendah, Kab. Bandung,"));
    buffer.writeln(centerText("Jawa Barat 40375"));
    buffer.writeln(centerText("Senin-Sabtu | 08.00 - 17.00"));
    buffer.writeln("--------------------------------");
    buffer.writeln("No. Faktur: ${Utility.getInvoiceNumber()}");
    buffer.writeln("Pelanggan: $customerName");
    buffer.writeln(
      "Tanggal: ${Utility.formatDateLocale(DateTime.now().toIso8601String())}",
    );
    buffer.writeln("--------------------------------");
    buffer.writeln(centerText(""));

    for (var entry in args.itemQuantities.entries) {
      final index = entry.key;
      final qty = entry.value;
      final itemName = args.itemNames[index];
      final variants = args.selectedVariants[index] ?? [];

      arrQty.add(qty);

      buffer.writeln("${qty}x $itemName");

      for (final v in variants.where((v) => v.quantity > 0)) {
        final subPrice = v.option.price * v.quantity;
        buffer.writeln(
          "  ${v.quantity}x ${v.option.variantCombo.values.map((v) => v.length > 5 ? v.substring(0, 5) : v).join("/")}",
        );
        buffer.writeln(
          '  @Rp${Utility.formatNumeralMask(v.option.price)} | Rp${Utility.formatNumeralMask(subPrice)}',
        );
      }
    }

    buffer.writeln(centerText(""));
    buffer.writeln("--------------------------------");

    final totalBarang = arrQty.fold(0, (a, b) => a + b);
    final subtotal = args.totalAmount;
    final diskon = 10000;
    final pajak = 0;
    final pembulatan = 0;
    final totalBayar = subtotal + pajak - diskon + pembulatan;

    buffer.writeln(
      "${"TOTAL ITEM".padRight(15)}: ${Utility.formatNumeralMask(totalBarang)} pcs",
    );
    buffer.writeln(
      "${"SUBTOTAL".padRight(15)}: Rp${Utility.formatNumeralMask(subtotal)}",
    );
    buffer.writeln(
      "${"DISKON".padRight(15)}: Rp${Utility.formatNumeralMask(diskon)}",
    );
    buffer.writeln(
      "${"PAJAK".padRight(15)}: Rp${Utility.formatNumeralMask(pajak)}",
    );
    buffer.writeln(
      "${"PEMBULATAN".padRight(15)}: Rp${Utility.formatNumeralMask(pembulatan)}",
    );
    buffer.writeln("--------------------------------");
    buffer.writeln(
      "${"GRAND TOTAL".padRight(15)}: Rp${Utility.formatNumeralMask(totalBayar)}",
    );
    buffer.writeln("");
    buffer.writeln(centerText("~ TERIMA KASIH ~"));
    buffer.writeln("");
    buffer.writeln("");
    buffer.writeln("");

    return buffer.toString();
  }

  static Future<BluetoothInfo?> selectPrinter() async {
    final List<BluetoothInfo> devices =
        await PrintBluetoothThermal.pairedBluetooths;

    if (devices.isNotEmpty) {
      final selectedAddress = await Get.toNamed(
        '/print-discovery',
        arguments: selectedPrinterAddress,
      );

      if (selectedAddress is String) {
        final matched = devices.firstWhere(
          (device) => device.macAdress == selectedAddress,
          orElse: () => BluetoothInfo(name: '', macAdress: ''),
        );

        selectedPrinterAddress = matched.macAdress;
        selectedPrinterName = matched.name;

        return matched; // ⬅️ RETURN
      }
    } else {
      showDangerToast(msg: 'Tidak ada printer yang terpasangkan.');
    }

    return null;
  }

  static Future<void> printInvoice(
    CashierParams args,
    TextEditingController nameTextController,
    SingleValueDropDownController nameController,
    SingleValueDropDownController typeController,
  ) async {
    try {
      final text = generateInvoiceText(
        args,
        nameTextController,
        nameController,
        typeController,
      );

      if (selectedPrinterAddress == null || selectedPrinterAddress!.isEmpty) {
        showDangerToast(msg: 'Alamat printer belum dipilih');
        return;
      }

      await PrintBluetoothThermal.connect(
        macPrinterAddress: selectedPrinterAddress!,
      );

      await PrintBluetoothThermal.writeBytes(text.codeUnits);
    } catch (e) {
      showDangerToast(msg: 'Gagal mencetak: $e');
    }
  }
}
