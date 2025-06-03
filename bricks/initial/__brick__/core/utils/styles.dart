import 'package:flutter/material.dart';

class Styles {
  const Styles({this.color = Colors.white});

  final Color? color;

  BoxDecoration get container => BoxDecoration(
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
