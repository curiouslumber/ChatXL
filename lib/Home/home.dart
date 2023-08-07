import 'package:flutter/material.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  HomeFragmentState createState() => HomeFragmentState();
}

class HomeFragmentState extends State<HomeFragment> {
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 32.0, right: 24.0),
            child: const Row(
              children: [
                Expanded(
                    flex: 4,
                    child: Text(
                      'Good Morning\nNoel,',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Ubuntu',
                          color: Color(0xffFFCFA3)),
                    )),
                Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    radius: 34.0,
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 7,
            child: Container(
                margin: const EdgeInsets.only(left: 32.0),
                alignment: Alignment.topLeft,
                child: const Text(
                  'Connect\nExcel\nwith AI',
                  style: TextStyle(
                      fontFamily: 'DaysOne',
                      color: Color(0xffFFCFA3),
                      fontSize: 28),
                ))),
        Expanded(
          flex: 7,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            margin: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xff034B40),
                  borderRadius: BorderRadius.circular(16.0)),
              child: Column(children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(left: 16.0, top: 8.0),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Dashboard',
                      style: TextStyle(
                          color: Color(0xffFFCFA3), fontFamily: 'Ubuntu'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.only(bottom: 14.0),
                    child: Row(children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                alignment: Alignment.center,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    const Text(
                                      '3/10',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                    Transform.scale(
                                      scale: availableHeight / 320,
                                      child: Transform.rotate(
                                        angle: -1.55,
                                        child: const CircularProgressIndicator(
                                          value: 0.3,
                                          strokeWidth: 3,
                                          backgroundColor: Colors.white,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Color.fromARGB(
                                                      255, 189, 147, 107)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(
                                'Sheets',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Ubuntu',
                                    color: Color(0xffFFCFA3)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                alignment: Alignment.center,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    const Text(
                                      '54/100',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                    Transform.scale(
                                      scale: availableHeight / 320,
                                      child: Transform.rotate(
                                        angle: -1.55,
                                        child: const CircularProgressIndicator(
                                          value: 0.54,
                                          strokeWidth: 3,
                                          backgroundColor: Colors.white,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Color.fromARGB(
                                                      255, 189, 147, 107)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(
                                'Tasks',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    fontSize: 14,
                                    color: Color(0xffFFCFA3)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ]),
            ),
          ),
        )
      ],
    );
  }
}
