import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/utils/utility.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    this.title,
    this.titleWidget,
    this.controller,
    this.focusNode,
    required this.hint,
    this.icon,
    this.textInputAction,
    this.type,
    this.validator,
    this.minLines = 1,
    this.maxLines = 1,
    this.isAuth = false,
    this.isNumeralMask = false,
    this.isDiscount = false,
    this.isPrice = false,
    this.onChanged,
    this.inputFormatters,
  });

  final String? title;
  final Widget? titleWidget;
  final bool? isAuth;
  final bool? isNumeralMask;
  final bool? isDiscount;
  final bool? isPrice; // untuk format Rp
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String hint;
  final Widget? icon;
  final TextInputAction? textInputAction;
  final TextInputType? type;
  final int? minLines;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;

  final String? Function(String? value)? validator;
  final void Function(String)? onChanged;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool obscureText = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if ((widget.isPrice == true || widget.isNumeralMask == true) &&
          widget.controller != null &&
          widget.controller!.text.isEmpty) {
        if (widget.isPrice == true) {
          widget.controller!.text = Utility.toLocale(0); // Rp 0
        } else {
          widget.controller!.text = '0';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isPassword =
        widget.isAuth == true || widget.type == TextInputType.visiblePassword;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        if (widget.titleWidget != null)
          widget.titleWidget!
        else if (widget.title != null)
          Text(widget.title!, style: AppTextStyle.medium),
        TextFormField(
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          validator: widget.validator,
          controller: widget.controller,
          focusNode: widget.focusNode,
          keyboardType:
              (widget.isPrice == true || widget.isNumeralMask == true)
                  ? TextInputType.number
                  : widget.type,
          textInputAction: widget.textInputAction,
          style: AppTextStyle.medium,
          obscureText: isPassword ? obscureText : false,
          inputFormatters: widget.inputFormatters,
          onChanged:
              (widget.isPrice == true || widget.isNumeralMask == true)
                  ? (value) {
                    // Jika custom format (ex: +1000 atau -500), jangan diubah-ubah
                    if (widget.isPrice == true &&
                        value.startsWith(RegExp(r'[+-]'))) {
                      widget.onChanged?.call(value);
                      return;
                    }

                    String newValue = value.replaceAll(RegExp(r'[^0-9]'), '');
                    int numberValue = int.tryParse(newValue) ?? 0;

                    if (widget.isPrice == true) {
                      widget.controller?.text = Utility.toLocale(numberValue);
                    } else {
                      widget.controller?.text = NumberFormat.decimalPattern(
                        'id_ID',
                      ).format(numberValue);
                    }

                    widget.controller?.selection = TextSelection.fromPosition(
                      TextPosition(offset: widget.controller!.text.length),
                    );

                    if (widget.onChanged != null) {
                      widget.onChanged!(widget.controller!.text);
                    }
                  }
                  : widget.onChanged,
          decoration: InputDecoration(
            prefixIcon: widget.icon,
            filled: true,
            fillColor: Colors.white,
            hintText: widget.hint,
            hintStyle: AppTextStyle.mediumThin,
            errorStyle: AppTextStyle.mediumRed,
            suffixIcon:
                isPassword
                    ? IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon:
                          obscureText
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                      color: AppColor.textfield,
                    )
                    : null,
            suffixText: widget.isDiscount == true ? '%' : null,
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.textfield,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.textfield),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.textfield,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
