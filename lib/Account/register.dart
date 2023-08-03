import 'package:chatdb/Elements/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../Intro/intropage.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    // ignore: unused_local_variable
    double availableWidth = mediaQueryData.size.width;
    // ignore: unused_local_variable
    double availableHeight = mediaQueryData.size.height;
    // ignore: unused_local_variable
    final double fontSize =
        availableHeight * 0.025; // Adjust the multiplier as needed
    double paddingFactor = 0.05;
    // ignore: unused_local_variable
    var horizontalpadding = mediaQueryData.size.width * paddingFactor;
    // ignore: unused_local_variable
    var verticalPadding = mediaQueryData.size.height * paddingFactor;

    return Container(
      color: Colors.green,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.green),
            backgroundColor: Colors.white,
            elevation: 5,
            title: const Text(
              'ChatDB',
              style: TextStyle(color: Colors.green),
            ),
            centerTitle: true,
            actions: [
              Container(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  minWidth: availableWidth / 10,
                  onPressed: () {
                    Get.offAll(() => const IntroPage());
                  },
                  shape: const CircleBorder(),
                  elevation: 0,
                  highlightElevation: 0,
                  color: Colors.greenAccent,
                  child: SvgPicture.asset(
                    'images/icon4.svg',
                    semanticsLabel: 'SVG Image',
                    height: 40,
                  ),
                ),
              ),
            ],
          ),
          body: Container(color: Colors.green),
        ),
      ),
    );
  }
}
