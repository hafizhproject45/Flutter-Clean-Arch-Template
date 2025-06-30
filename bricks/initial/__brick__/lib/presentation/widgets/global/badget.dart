import 'package:flutter/material.dart';

import '../../../core/utils/text_style.dart';

class MyCustomBadge extends StatelessWidget {
  final String label;
  final Color color;

  const MyCustomBadge({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withAlpha(50),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label.toUpperCase(),
        style: AppTextStyle.smallBold.copyWith(fontSize: 10, color: color),
        overflow: TextOverflow.visible,
        softWrap: false,
      ),
    );
  }
}
