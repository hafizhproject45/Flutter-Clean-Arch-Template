import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/utils/text_style.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? createdAt;
  final int length;
  final void Function()? onTap;

  const CardWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.createdAt,
    this.length = 1,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: Styles.container(),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          title: Text(
            title,
            style: AppTextStyle.bodyBoldPrimary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle:
              subtitle == null
                  ? null
                  : Text(
                    subtitle!,
                    style: AppTextStyle.smallThin,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              createdAt != null
                  ? Text('Dibuat pada', style: AppTextStyle.smallThin)
                  : const SizedBox.shrink(),
              Text(createdAt ?? '', style: AppTextStyle.small),
            ],
          ),
        ),
      ),
    );
  }
}
