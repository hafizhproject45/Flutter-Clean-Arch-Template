import 'package:flutter/material.dart';

class Styles {
  static BoxDecoration container({Color? color = Colors.white}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: color,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withValues(alpha: 0.1),
          spreadRadius: 5,
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    );
  }
}
