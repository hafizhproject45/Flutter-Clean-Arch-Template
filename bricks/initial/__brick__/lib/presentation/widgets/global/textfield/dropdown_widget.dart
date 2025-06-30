import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_style.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({
    super.key,
    this.controller,
    this.search = false,
    this.onChanged,
    this.width,
    this.label,
    this.labelWidget,
    this.hint,
    required this.values,
    this.validator,
    this.enabled = true,
    this.clearOption = true,
  });

  final SingleValueDropDownController? controller;
  final Function(dynamic)? onChanged;
  final bool? search;
  final double? width;
  final String? label;
  final Widget? labelWidget;
  final String? hint;
  final List<DropDownValueModel> values;
  final String? Function(String?)? validator;

  final bool? enabled;
  final bool? clearOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelWidget != null)
          labelWidget!
        else if (label != null)
          Text(label!, style: AppTextStyle.medium),

        const SizedBox(height: 10),

        DropDownTextField(
          isEnabled: enabled!,
          controller: controller,
          enableSearch: search!,
          searchTextStyle: AppTextStyle.medium,
          clearOption: clearOption!,
          textStyle: AppTextStyle.medium,
          textFieldDecoration: InputDecoration(
            enabled: enabled!,
            filled: true,
            fillColor: Colors.white,
            hintText: hint,
            errorStyle: AppTextStyle.mediumRed,
            hintStyle: AppTextStyle.mediumThin,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.textfield),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.textfield),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.textfield),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          clearIconProperty: IconProperty(color: AppColor.textBody),
          listTextStyle: AppTextStyle.medium,
          validator: validator,
          dropdownRadius: 10,
          dropDownIconProperty:
              enabled == false
                  ? IconProperty(color: AppColor.white)
                  : IconProperty(color: AppColor.textSmall),
          dropDownList: values,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
