import 'package:animations/animations.dart';
import 'package:chatdb/Home/account.dart';
import 'package:chatdb/Home/home.dart';
import 'package:chatdb/Elements/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../Intro/intropage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _fragments = [const HomeFragment(), const AccountFragment()];

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
      color: const Color.fromARGB(255, 69, 219, 116),
      child: SafeArea(
        child: Scaffold(
          drawer: const Sidebar(),
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
          body: PageTransitionSwitcher(
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
              return SharedAxisTransition(
                animation: primaryAnimation,
                fillColor: Colors.green,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
                child: child,
              );
            },
            child: _fragments[_currentIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            selectedItemColor: Colors.green,
            backgroundColor: Colors.white,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded), label: 'Account')
            ],
          ),
        ),
      ),
    );
  }
}
