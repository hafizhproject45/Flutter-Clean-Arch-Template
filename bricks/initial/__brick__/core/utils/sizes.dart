import 'package:flutter/material.dart';

class GetSize {
  static double screenWidth(BuildContext context, {double? percent}) {
    final width = MediaQuery.of(context).size.width;
    return percent == null ? width : width * percent;
  }

  static double screenHeight(BuildContext context, {double? percent}) {
    final height = MediaQuery.of(context).size.height;
    return percent == null ? height : height * percent;
  }
}
