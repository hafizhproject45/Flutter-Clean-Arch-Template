import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showSuccessToast({required String msg, int duration = 3}) {
  toastification.show(
    type: ToastificationType.success,
    style: ToastificationStyle.fillColored,
    title: Text(msg),
    autoCloseDuration: Duration(seconds: duration),
    alignment: Alignment.topCenter,
    showProgressBar: true,
    applyBlurEffect: true,
  );
}

void showDangerToast({required String msg, int duration = 3}) {
  toastification.show(
    type: ToastificationType.error,
    style: ToastificationStyle.fillColored,
    title: Text(msg),
    autoCloseDuration: Duration(seconds: duration),
    alignment: Alignment.topCenter,
    showProgressBar: true,
    applyBlurEffect: true,
  );
}

void showWarningToast({required String msg, int duration = 3}) {
  toastification.show(
    type: ToastificationType.warning,
    style: ToastificationStyle.fillColored,
    title: Text(msg),
    autoCloseDuration: Duration(seconds: duration),
    alignment: Alignment.topCenter,
    showProgressBar: true,
    applyBlurEffect: true,
  );
}
