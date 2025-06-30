import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/text_style.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          color: AppColor.background,
          // image: DecorationImage(
          //   image: AssetImage(AppImages.bg),
          //   fit: BoxFit.cover,
          //   filterQuality: FilterQuality.high,
          // ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    // padding: const EdgeInsets.only(bottom: 50),
                    // height: 200,
                    child: Text(
                      "Application Loading",
                      style: AppTextStyle.headingPrimary,
                    ),
                  ),
                  const SpinKitThreeBounce(color: AppColor.primary, size: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
