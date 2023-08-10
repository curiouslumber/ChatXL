import 'package:chatdb/Home/homepage2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

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

    return Container(
      color: Colors.green,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SvgPicture.asset(
                          'images/icon1.svg',
                          semanticsLabel: 'SVG Image',
                          height: availableHeight / 7,
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(
                                left: verticalPadding * 0.5,
                                top: verticalPadding * 0.4),
                            child: Text(
                              "Welcome to\nChatDB!",
                              style: TextStyle(
                                fontSize: fontSize * 1.9,
                                height: verticalPadding * 0.030,
                                fontFamily: 'Gabriola',
                                color: Colors.white,
                                shadows: const [
                                  Shadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 3),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: SizedBox(
                  width: availableWidth,
                  child: Image.asset(
                    'images/icon2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding:
                              EdgeInsets.only(right: horizontalpadding * 1.8),
                          alignment: Alignment.centerRight,
                          child: Text(
                            "A comprehsive\ntutorial\nto using the app",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: fontSize * 1.9,
                              color: Colors.white,
                              height: fontSize * 0.07,
                              fontFamily: 'Gabriola',
                              shadows: const [
                                Shadow(
                                  color: Colors.black12,
                                  offset: Offset(-1, 4),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: horizontalpadding,
                                    vertical: verticalPadding * 0.7),
                                child: MaterialButton(
                                  onPressed: () {
                                    Get.offAll(() => const HomePage2());
                                  },
                                  color: const Color(0xFFBFFE72),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16.0),
                                          bottomRight: Radius.circular(16.0))),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Skip',
                                      style: TextStyle(
                                        fontFamily: 'LucidaSans',
                                        fontSize: fontSize * 1.4,
                                        color: Colors.black.withOpacity(0.7),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: horizontalpadding,
                                    vertical: verticalPadding * 0.7),
                                child: MaterialButton(
                                  onPressed: () {},
                                  color: const Color(0xFFBFFE72),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(16.0),
                                          bottomLeft: Radius.circular(16.0))),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Next',
                                      style: TextStyle(
                                        fontFamily: 'LucidaSans',
                                        fontSize: fontSize * 1.4,
                                        color: Colors.black.withOpacity(0.7),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
