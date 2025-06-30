import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/utils/text_style.dart';
import '../button/my_button_widget.dart';

class MyDetailCard extends StatelessWidget {
  const MyDetailCard({
    super.key,
    required this.title,
    required this.value,
    this.isFromSKU = true,
    this.createdAt,
    this.updatedAt,
    this.isLoading = false,
    this.isResetLoading = false,
    this.isUpdate = true,
    this.isDelete = true,
    this.isResetPassword = false,
    this.isSale = false,
    this.onPressedUpdate,
    this.onPressedDelete,
    this.onPressedResetPassword,
    this.onPressedPrint,
    this.onPressedPreviewPrint,
  });

  final List<String> title;
  final List<dynamic> value;
  final bool isFromSKU;
  final String? createdAt;
  final String? updatedAt;
  final bool? isLoading;
  final bool? isResetLoading;
  final bool? isUpdate;
  final bool? isDelete;
  final bool? isResetPassword;
  final bool? isSale;
  final void Function()? onPressedUpdate;
  final void Function()? onPressedDelete;
  final void Function()? onPressedResetPassword;
  final void Function()? onPressedPrint;
  final void Function()? onPressedPreviewPrint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: Styles.container(),
      child: Column(
        children: [
          Table(
            columnWidths: const {
              0: IntrinsicColumnWidth(),
              1: FixedColumnWidth(10),
              2: FlexColumnWidth(),
            },
            children: List.generate(title.length, (index) {
              return TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(title[index], style: AppTextStyle.medium),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text(':'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child:
                        value[index] is String
                            ? Text(
                              value[index],
                              style: AppTextStyle.mediumBold,
                              softWrap: true,
                            )
                            : value[index],
                  ),
                ],
              );
            }),
          ),
          Container(
            width: double.infinity,
            height: 0.3,
            color: AppColor.textSmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('Dibuat pada', style: AppTextStyle.medium),
                  Text(createdAt ?? '-', style: AppTextStyle.mediumBold),
                ],
              ),
              const SizedBox(width: 30),
              Column(
                children: [
                  Text('Diupdate pada', style: AppTextStyle.medium),
                  Text(updatedAt ?? '-', style: AppTextStyle.mediumBold),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (isUpdate == true)
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: MyButtonWidget(
                      onPressed: onPressedUpdate,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.edit, color: Colors.white),
                          const SizedBox(width: 5),
                          Text('Ubah', style: AppTextStyle.body),
                        ],
                      ),
                    ),
                  ),
                ),
              if (isDelete == true)
                Expanded(
                  flex: 1,
                  child:
                      isUpdate == true
                          ? Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: MyButtonWidget(
                              onPressed: onPressedDelete,
                              buttonColor: Colors.red,
                              isLoading: isLoading,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.delete, color: Colors.white),
                                  const SizedBox(width: 5),
                                  Text('Hapus', style: AppTextStyle.bodyWhite),
                                ],
                              ),
                            ),
                          )
                          : MyButtonWidget(
                            onPressed: onPressedDelete,
                            buttonColor: Colors.red,
                            isLoading: isLoading,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.delete, color: Colors.white),
                                const SizedBox(width: 5),
                                Text('Hapus', style: AppTextStyle.bodyWhite),
                              ],
                            ),
                          ),
                ),
            ],
          ),
          if (isResetPassword == true)
            Row(
              children: [
                Expanded(
                  child: MyButtonWidget(
                    onPressed: onPressedResetPassword,
                    buttonColor: AppColor.secondary,
                    isLoading: isResetLoading,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.lock_reset, color: Colors.white),
                        const SizedBox(width: 5),
                        Text('Reset Password', style: AppTextStyle.bodyWhite),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
