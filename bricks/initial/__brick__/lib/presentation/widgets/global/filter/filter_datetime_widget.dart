import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/sizes.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/utils/utility.dart';
import '../button/my_button_widget.dart';

class FilterDatetimeWidget extends StatefulWidget {
  final bool? isRange;
  final String? label;
  final String? hint;
  final List<DateTime?>? initialValue;

  /// Dipanggil saat tombol SIMPAN ditekan
  final void Function(List<DateTime?> selectedDates)? onPressedSimpan;

  const FilterDatetimeWidget({
    super.key,
    this.label = 'Tanggal Transaksi',
    this.hint = 'Pilih Tanggal Transaksi',
    this.isRange = true,
    this.initialValue,
    this.onPressedSimpan,
  });

  @override
  State<FilterDatetimeWidget> createState() => _FilterDatetimeWidgetState();
}

class _FilterDatetimeWidgetState extends State<FilterDatetimeWidget> {
  List<DateTime?> selectedDates = [];
  List<DateTime?> tempDates = [];

  @override
  void initState() {
    super.initState();
    selectedDates = widget.initialValue ?? [];
    tempDates = List.from(selectedDates);
  }

  @override
  void didUpdateWidget(covariant FilterDatetimeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      setState(() {
        selectedDates = widget.initialValue ?? [];
        tempDates = List.from(selectedDates);
      });
    }
  }

  String get displayText {
    if (selectedDates.isEmpty || selectedDates.first == null) {
      return widget.hint!;
    }

    if (widget.isRange!) {
      final start = selectedDates[0];
      final end = selectedDates.length > 1 ? selectedDates[1] : null;
      return widget.isRange == true
          ? '${_formatDate(start)} - ${_formatDate(end)}'
          : _formatDate(start);
    } else {
      return _formatDate(selectedDates.first);
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '-';
    return Utility.formatDateLocale(date.toString());
  }

  void _openCalendarDialog() {
    tempDates = List.from(selectedDates);
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CalendarDatePicker2(
                    config: CalendarDatePicker2Config(
                      allowSameValueSelection: true,
                      calendarType:
                          widget.isRange!
                              ? CalendarDatePicker2Type.range
                              : CalendarDatePicker2Type.single,
                      currentDate: DateTime.now(),
                    ),
                    value: tempDates,
                    onValueChanged: (value) {
                      tempDates = value;
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyButtonWidget(
                        onPressed: () {
                          setState(() {
                            selectedDates = [];
                          });
                          Get.back();
                        },
                        label: 'Batal',
                        buttonColor: AppColor.secondary,
                      ),
                      const SizedBox(width: 5),
                      MyButtonWidget(
                        onPressed: () {
                          setState(() {
                            selectedDates = List.from(
                              tempDates,
                            ); // ← simpan baru
                          });
                          widget.onPressedSimpan?.call(selectedDates);
                          Get.back();
                        },
                        label: 'Simpan',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label!, style: AppTextStyle.medium),
        const SizedBox(height: 10),
        InkWell(
          onTap: _openCalendarDialog,
          child: Container(
            width: GetSize.screenWidth(context),
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 12),
            decoration: Styles.container().copyWith(
              border: Border.all(color: AppColor.textfield),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(displayText, style: AppTextStyle.mediumThin),
          ),
        ),
      ],
    );
  }
}
