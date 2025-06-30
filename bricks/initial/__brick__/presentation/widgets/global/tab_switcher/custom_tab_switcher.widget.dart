import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/utils/text_style.dart';

class CustomTabSwitcher extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onTabChanged;
  final List<String> tabs;

  const CustomTabSwitcher({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Styles.container(),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final label = tabs[index];
          return Expanded(
            child: _buildTab(context, label, index, selectedIndex == index),
          );
        }),
      ),
    );
  }

  Widget _buildTab(
    BuildContext context,
    String label,
    int index,
    bool selected,
  ) {
    return GestureDetector(
      onTap: () => onTabChanged(index),
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          color: selected ? AppColor.primary : Colors.transparent,
          border: Border.all(color: const Color.fromARGB(255, 203, 202, 202)),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(index == 0 ? 5 : 0),
            bottomLeft: Radius.circular(index == 0 ? 5 : 0),
            topRight: Radius.circular(index == tabs.length - 1 ? 5 : 0),
            bottomRight: Radius.circular(index == tabs.length - 1 ? 5 : 0),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: selected ? AppTextStyle.mediumWhite : AppTextStyle.medium,
          ),
        ),
      ),
    );
  }
}
