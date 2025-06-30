// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/sizes.dart';
import '../../../../core/utils/styles.dart';

part 'my_shimmer_infinity.dart';

class ShimmerCustomWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;

  const ShimmerCustomWidget({
    Key? key,
    this.width = 0,
    this.height = 0,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 1000),
      baseColor: AppColor.shimmer,
      highlightColor: AppColor.shimmerHighlight,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 5),
          color: AppColor.shimmer,
        ),
      ),
    );
  }
}

class MyShimmerListView extends StatelessWidget {
  const MyShimmerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            height: 70,
            padding: const EdgeInsets.all(12),
            decoration: Styles.container(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title + subtitle shimmer
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      ShimmerCustomWidget(height: 12, width: 150),
                      SizedBox(height: 10),
                      ShimmerCustomWidget(height: 10, width: 100),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // Stok shimmer
                const ShimmerCustomWidget(height: 20, width: 60),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MasterDetailCardShimmer extends StatelessWidget {
  const MasterDetailCardShimmer({
    super.key,
    required this.titleCount,
    this.hasDateInfo = true,
    this.isDelete = true,
    this.hasActionButtons = true,
  });

  final int titleCount;
  final bool hasDateInfo;
  final bool isDelete;
  final bool hasActionButtons;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: Styles.container(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(titleCount, (index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_shimmerRow(), const SizedBox(height: 12)],
            );
          }),

          if (hasDateInfo) ...[
            const SizedBox(height: 8),
            Divider(color: AppColor.textSmall, height: 1),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ShimmerCustomWidget(height: 14, width: 80),
                    const SizedBox(height: 6),
                    ShimmerCustomWidget(height: 16, width: 140),
                  ],
                ),
                const SizedBox(width: 30),
                Column(
                  children: [
                    ShimmerCustomWidget(height: 14, width: 100),
                    const SizedBox(height: 6),
                    ShimmerCustomWidget(height: 16, width: 140),
                  ],
                ),
              ],
            ),
          ],

          if (hasActionButtons) ...[
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: ShimmerCustomWidget(
                    height: 45,
                    width: double.infinity,
                  ),
                ),
                if (isDelete == true) ...[
                  const SizedBox(width: 10),
                  Expanded(
                    child: ShimmerCustomWidget(
                      height: 45,
                      width: double.infinity,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _shimmerRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 80,
          child: ShimmerCustomWidget(height: 14, width: 60),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(':'),
        ),
        const Expanded(
          child: ShimmerCustomWidget(height: 16, width: double.infinity),
        ),
      ],
    );
  }
}
