// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_null_comparison
import 'package:flutter/material.dart';

import '../../../../core/utils/text_style.dart';

class MyCard extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final String? desc;
  final int stock;

  const MyCard({
    super.key,
    required this.onTap,
    required this.title,
    this.desc,
    required this.stock,
  });

  TextStyle handleStock() {
    if (stock < 1) {
      return AppTextStyle.bodyBoldRed;
    }
    return AppTextStyle.bodyBoldPrimary;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(158, 158, 158, 0.15),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 228, 227, 227),
              borderRadius: BorderRadius.all(Radius.circular(3)),
            ),
            width: 50,
            child: Center(child: Text('Image', style: AppTextStyle.small)),
          ),
          title: Text(
            title,
            style: AppTextStyle.bodyBoldPrimary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle:
              desc != null
                  ? Text(
                    desc ?? '',
                    style: AppTextStyle.mediumThin,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                  : const SizedBox.shrink(),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Stok', style: AppTextStyle.smallThin),
              Text(stock.toString(), style: handleStock()),
            ],
          ),
        ),
      ),
    );
  }
}
