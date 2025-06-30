import 'package:flutter/material.dart';

import 'colors.dart';

class AppBaseTextStyle {
  static const TextStyle baseHeading = TextStyle(
    color: AppColor.primary,
    fontSize: 24,
    fontWeight: FontWeight.w800,
  );
  static const TextStyle baseSubHeading = TextStyle(
    color: AppColor.primary,
    fontSize: 20,
    fontWeight: FontWeight.w800,
  );
  static const TextStyle baseBody = TextStyle(
    color: AppColor.primary,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle baseMedium = TextStyle(
    color: AppColor.primary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle baseSmall = TextStyle(
    color: AppColor.primary,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
}

class AppTextStyle {
  // Heading Styles
  static final heading = AppBaseTextStyle.baseHeading.copyWith(
    fontWeight: FontWeight.w800,
    color: AppColor.textHeading,
  );
  static final headingBoldPrimary = AppBaseTextStyle.baseHeading.copyWith(
    fontWeight: FontWeight.w900,
    color: AppColor.primary,
  );
  static final headingPrimary = AppBaseTextStyle.baseHeading.copyWith(
    fontWeight: FontWeight.w800,
    color: AppColor.primary,
  );
  static final headingAccent = headingPrimary;
  static final headingWhite = AppBaseTextStyle.baseHeading.copyWith(
    fontWeight: FontWeight.w800,
    color: AppColor.white,
  );

  // Sub Heading
  static final subHeading = AppBaseTextStyle.baseSubHeading.copyWith(
    fontWeight: FontWeight.w800,
    color: AppColor.textHeading,
  );
  static final subHeadingPrimary = AppBaseTextStyle.baseSubHeading.copyWith(
    fontWeight: FontWeight.w800,
    color: AppColor.primary,
  );
  static final subHeadingPrimaryBold = subHeadingPrimary;
  static final subHeadingAccent = subHeadingPrimary;
  static final subHeadingWhite = AppBaseTextStyle.baseSubHeading.copyWith(
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );

  // Body Styles
  static final body = AppBaseTextStyle.baseBody.copyWith(
    fontWeight: FontWeight.w600,
  );
  static final bodyBold = AppBaseTextStyle.baseBody.copyWith(
    fontWeight: FontWeight.w800,
  );
  static final bodyBoldPrimary = bodyBold.copyWith(color: AppColor.primary);
  static final bodyBoldSecondary = bodyBold.copyWith(color: AppColor.secondary);
  static final bodyBoldRed = bodyBold.copyWith(color: Colors.red);
  static final bodyRed = AppBaseTextStyle.baseBody.copyWith(
    fontWeight: FontWeight.w600,
    color: Colors.red,
  );
  static final bodyBoldWhite = bodyBold.copyWith(color: Colors.white);
  static final bodyWhite = AppBaseTextStyle.baseBody.copyWith(
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static final bodyThinPrimary = AppBaseTextStyle.baseBody.copyWith(
    fontWeight: FontWeight.w500,
    color: AppColor.primary,
  );
  static final bodyThin = AppBaseTextStyle.baseBody.copyWith(
    fontWeight: FontWeight.w500,
    color: AppColor.textSmall,
  );
  static final bodyThinBlack = bodyThin.copyWith(color: Colors.black);
  static final bodyThinWhite = AppBaseTextStyle.baseBody.copyWith(
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );

  // Medium Styles
  static final medium = AppBaseTextStyle.baseMedium.copyWith(
    fontWeight: FontWeight.w400,
    color: AppColor.textBody,
  );
  static final mediumBold = AppBaseTextStyle.baseMedium.copyWith(
    fontWeight: FontWeight.w700,
  );
  static final mediumBoldPrimary = mediumBold.copyWith(color: AppColor.primary);
  static final mediumPrimary = AppBaseTextStyle.baseMedium.copyWith(
    fontWeight: FontWeight.w400,
    color: AppColor.primary,
  );
  static final mediumWhite = AppBaseTextStyle.baseMedium.copyWith(
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );
  static final mediumBlack = AppBaseTextStyle.baseMedium.copyWith(
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  static final mediumRed = AppBaseTextStyle.baseMedium.copyWith(
    fontWeight: FontWeight.w400,
    color: Colors.red,
  );
  static final mediumThin = AppBaseTextStyle.baseMedium.copyWith(
    fontWeight: FontWeight.w400,
    color: AppColor.textSmall,
  );

  // Small Styles
  static final smallBold = AppBaseTextStyle.baseSmall.copyWith(
    fontWeight: FontWeight.w800,
  );
  static final smallBoldPrimary = smallBold.copyWith(color: AppColor.primary);
  static final smallBoldSecondary = smallBold.copyWith(
    color: AppColor.secondary,
  );
  static final smallBoldRed = smallBold.copyWith(color: Colors.red);
  static final smallBoldGreen = smallBold.copyWith(color: Colors.green);
  static final small = AppBaseTextStyle.baseSmall.copyWith(
    fontWeight: FontWeight.w500,
    color: AppColor.textHeading,
  );
  static final smallRed = small.copyWith(color: Colors.red);
  static final smallWhite = small.copyWith(color: AppColor.white);
  static final smallThin = AppBaseTextStyle.baseSmall.copyWith(
    fontWeight: FontWeight.w400,
    color: AppColor.textSmall,
  );
  static final smallPrimary = small.copyWith(
    fontWeight: FontWeight.w400,
    color: AppColor.primary,
  );
}
