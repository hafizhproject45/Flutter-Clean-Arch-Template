import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/text_style.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? action;
  final PreferredSizeWidget? bottom;

  const MyAppBar({
    super.key,
    required this.title,
    this.leading,
    this.action,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: AppTextStyle.subHeadingPrimaryBold),
      centerTitle: false,
      backgroundColor: Colors.white,
      leading: leading,
      actions: action,
      bottom: bottom,
      foregroundColor: AppColor.textSmall,
      surfaceTintColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(bottom != null ? 100 : 70);
}
