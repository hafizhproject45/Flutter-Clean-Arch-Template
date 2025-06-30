import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_style.dart';

class MyButtonWidget extends StatelessWidget {
  final bool? isFilled;
  final String? label;
  final double? width;
  final double? height;
  final bool fixedSize;
  final double borderRadius;
  final Color buttonColor;
  final Color textColor;
  final IconData? iconz;
  final void Function()? onPressed;
  final bool? isLoading;
  final Widget? child;

  const MyButtonWidget({
    this.isFilled = true,
    this.label,
    this.width,
    this.height,
    this.fixedSize = false,
    this.borderRadius = 10,
    this.buttonColor = AppColor.primary,
    this.textColor = AppColor.white,
    required this.onPressed,
    this.iconz,
    super.key,
    this.isLoading = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isFilled! ? buttonColor : Colors.white,
        fixedSize: fixedSize ? Size(width ?? 0, height ?? 0) : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          side:
              !isFilled! && onPressed != null
                  ? BorderSide(color: AppColor.primary)
                  : BorderSide.none,
        ),
      ),
      child:
          isLoading!
              ? const SpinKitThreeBounce(color: Colors.white, size: 20)
              : child ??
                  Text(
                    label!,
                    style: AppTextStyle.medium.copyWith(color: textColor),
                  ),
    );
  }
}
