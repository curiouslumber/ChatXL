// old file
import 'package:get/get.dart';
import '../Intro/intropage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsive data
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

    List<String> titles = [
      "Go to tutorial",
      "Export Database to Excel",
      "Rate the app!",
      "Exit"
    ];

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.green,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(
                      top: verticalPadding * 0.3,
                      left: horizontalpadding * 0.05),
                  alignment: Alignment.centerLeft,
                  child: MaterialButton(
                    shape: const CircleBorder(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      'images/icon3.svg',
                      semanticsLabel: 'SVG Image',
                      height: availableHeight / 14,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: verticalPadding * 2),
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 40.0, right: 40.0, bottom: 40.0),
                        child: MaterialButton(
                          onPressed: () {
                            if (index == 0) {
                              Get.to(() => const IntroPage());
                            }
                          },
                          color: Colors.white,
                          height: availableHeight / 12,
                          child: Container(
                            padding: const EdgeInsets.only(top: 4.0),
                            alignment: Alignment.center,
                            child: Text(
                              titles[index],
                              style: TextStyle(
                                fontSize: fontSize * 1.4,
                                fontFamily: 'Gabriola',
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
