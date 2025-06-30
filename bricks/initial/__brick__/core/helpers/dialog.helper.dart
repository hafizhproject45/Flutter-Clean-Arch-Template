import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:{{project_name}}/core/utils/colors.dart';
import 'package:{{project_name}}/core/utils/text_style.dart';
import 'package:{{project_name}}/presentation/widgets/global/button/my_button_widget.dart';

void showConfirmationDialog({
  required BuildContext context,
  required String title,
  String? message,
  required VoidCallback onConfirm,
  VoidCallback? cancelConfirm,
  String confirmText = 'Ya',
  String cancelText = 'Batal',
  Color confirmColor = Colors.red,
  TextSpan? richMessageSpan,
  bool isBack = true,
  bool isCloseButton = false, // ⬅️ tambahan flag
}) {
  showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        titlePadding: const EdgeInsets.only(top: 20, left: 20, right: 10),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(title, style: AppTextStyle.body)),
            if (isCloseButton)
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => Get.back(),
                child: const Padding(
                  padding: EdgeInsets.all(6),
                  child: Icon(Icons.close, size: 20, color: Colors.grey),
                ),
              ),
          ],
        ),
        content:
            message == null ? RichText(text: richMessageSpan!) : Text(message),
        actionsPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        actions: [
          MyButtonWidget(
            onPressed: cancelConfirm ?? () => Get.back(),
            label: cancelText,
            textColor: AppColor.textSmall,
            buttonColor: AppColor.textSmall,
            isFilled: false,
          ),
          MyButtonWidget(
            buttonColor: confirmColor,
            onPressed: () {
              onConfirm();
              if (isBack) {
                Get.back();
              }
            },
            label: confirmText,
          ),
        ],
      );
    },
  );
}
