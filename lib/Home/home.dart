import 'package:chatdb/Home/homepage2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Chat/chatpage.dart';

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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 28, 180, 63),
          Color.fromARGB(255, 58, 174, 95),
          Color.fromARGB(255, 28, 180, 67)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Column(children: [
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.center,
            child: const Text(
              'Welcome!',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            margin: EdgeInsets.only(
                left: horizontalpadding / 3,
                right: horizontalpadding / 3,
                bottom: verticalPadding / 3),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
            child: Column(children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.only(top: 16.0),
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
                                        fontSize: 20, color: Colors.grey),
                                  ),
                                  Transform.scale(
                                    scale: availableHeight / 235,
                                    child: Transform.rotate(
                                      angle: -1.55,
                                      child: CircularProgressIndicator(
                                        value: 0.3,
                                        strokeWidth: 4,
                                        backgroundColor: Colors.grey[300],
                                        valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                                Colors.blue),
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
                              'Databases',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 9, 101, 64)),
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
                                        fontSize: 20, color: Colors.grey),
                                  ),
                                  Transform.scale(
                                    scale: availableHeight / 235,
                                    child: Transform.rotate(
                                      angle: -1.55,
                                      child: CircularProgressIndicator(
                                        value: 0.54,
                                        strokeWidth: 4,
                                        backgroundColor: Colors.grey[300],
                                        valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                                Colors.blue),
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
                              'Tables',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 9, 101, 64)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 16.0, left: 16.0),
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    'No. of query performed :',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 9, 101, 64)),
                  ),
                ),
              )
            ]),
          ),
        ),
        Expanded(
          flex: 6,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 2,
              child: MaterialButton(
                minWidth: availableWidth / 1.1,
                onPressed: () {
                  Get.to(() => const ChatPage());
                },
                color: Colors.white,
                child: const Text(
                  'Start Chat',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 9, 101, 64)),
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 2,
              child: MaterialButton(
                minWidth: availableWidth / 1.1,
                onPressed: () {
                  Get.to(() => const HomePage2());
                },
                color: Colors.white,
                child: const Text(
                  'View My Databases',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 9, 101, 64)),
                ),
              ),
            ),
            const Spacer(flex: 1)
          ]),
        )
      ]),
    );
  }
}
