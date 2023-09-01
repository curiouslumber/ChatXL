import 'package:chatdb/Chat/controller.dart';
import 'package:chatdb/Home/account.dart';
import 'package:chatdb/Home/accounthandler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Database/databasehelper.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  HomeFragmentState createState() => HomeFragmentState();
}

class HomeFragmentState extends State<HomeFragment> {
  User? user = FirebaseAuth.instance.currentUser;
  final dbHelper = DatabaseHelper();
  AccountHandler handler = AccountHandler();
  Controller c = Get.put(Controller());

  var greetings = ["Good Morning", "Good Afternoon", "Good Evening"];
  var currentGreetingIndex = 0;

  void selectGreeting() {
    var currentTime = DateTime.now().hour;
    if (12 <= currentTime || currentTime < 16) {
      currentGreetingIndex = 1;
    } else if (0 <= currentTime || currentTime < 12) {
      currentGreetingIndex = 0;
    } else if (16 <= currentTime || currentTime < 0) {
      currentGreetingIndex = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Responsive data
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    // ignore: unused_local_variable
    double availableWidth = mediaQueryData.size.width;
    // ignore: unused_local_variable
    double availableHeight = mediaQueryData.size.height;

    var googleName = "";

    if (user != null) {
      var email = user?.email;
      var tempName = user?.displayName;
      googleName = tempName.toString();
      var userEmail = email.toString();
      if (googleName == 'null') {
        handler.accountHandler(userEmail);
      }
    }

    selectGreeting();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 32.0, right: 24.0),
            margin: const EdgeInsets.only(top: 16.0),
            child: Row(
              children: [
                Expanded(
                    flex: 4,
                    child: Obx(
                      () => Text(
                        '${greetings[currentGreetingIndex]}\n${(c.displayName.value == "" && (googleName == "" || googleName == "null")) ? 'User' : (googleName == "null" ? c.displayName.value : googleName)},',
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Ubuntu',
                            color: Color(0xffFFCFA3)),
                        maxLines: 2,
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            _CustomPageRoute(
                              builder: (context) =>
                                  const FullScreenAvatarPage(),
                              transitionBuilder: _transitionBuilder,
                              tag: 'avatarTag',
                            ),
                          );
                        },
                        child: Hero(
                          tag: 'avatarTag',
                          child: Container(
                            decoration: user?.email! == null
                                ? BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withOpacity(0.05), // Shadow color
                                        spreadRadius:
                                            5, // How far the shadow extends from the object
                                        blurRadius:
                                            4, // The radius of the shadow blur
                                        offset: const Offset(0,
                                            4), // The offset of the shadow from the object
                                      ),
                                    ],
                                  )
                                : BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withOpacity(0.02), // Shadow color
                                        spreadRadius:
                                            5, // How far the shadow extends from the object
                                        blurRadius:
                                            4, // The radius of the shadow blur
                                        offset: const Offset(0,
                                            4), // The offset of the shadow from the object
                                      ),
                                    ],
                                  ),
                            child: user?.photoURL == null
                                ? const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 50,
                                    child: Icon(
                                      size: 40,
                                      Icons.person,
                                      color: Color(0xff405C5A),
                                    ),
                                  )
                                : CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(user!.photoURL!),
                                    radius: 40,
                                  ),
                          ),
                        ),
                      ),
                    )),
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
                  fontSize: 34),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            margin: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  // decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05), // Shadow color
                      spreadRadius:
                          3, // How far the shadow extends from the object
                      blurRadius: 2, // The radius of the shadow blur
                      offset: const Offset(
                          0, 3), // The offset of the shadow from the object
                    ),
                  ],
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
                    child: FutureBuilder<List<Map<String, dynamic>>>(
                      future: dbHelper.getContacts(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container();
                        } else {
                          List<Map<String, dynamic>> contacts = snapshot.data!;

                          return Row(children: [
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
                                          Text(
                                            '${contacts.length}/10',
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                          Transform.scale(
                                            scale: availableHeight / 320,
                                            child: Transform.rotate(
                                              angle: -1.55,
                                              child: CircularProgressIndicator(
                                                value: contacts.length / 10,
                                                strokeWidth: 3,
                                                backgroundColor: Colors.white,
                                                valueColor:
                                                    const AlwaysStoppedAnimation<
                                                        Color>(
                                                  Color.fromARGB(
                                                      255, 189, 147, 107),
                                                ),
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
                                            '0/50',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                          Transform.scale(
                                            scale: availableHeight / 320,
                                            child: Transform.rotate(
                                              angle: -1.55,
                                              child:
                                                  const CircularProgressIndicator(
                                                value: 0,
                                                strokeWidth: 3,
                                                backgroundColor: Colors.white,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                            Color>(
                                                        Color.fromARGB(255, 189,
                                                            147, 107)),
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
                          ]);
                        }
                      },
                    ),
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

class _CustomPageRoute extends PageRouteBuilder {
  final WidgetBuilder builder;
  final Widget Function(
          BuildContext, Animation<double>, Animation<double>, Widget)
      transitionBuilder;
  final String tag;

  _CustomPageRoute({
    required this.builder,
    required this.transitionBuilder,
    required this.tag,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: transitionBuilder,
        );
}

Widget _transitionBuilder(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  const begin = Offset(0.0, 1.0);
  const end = Offset.zero;
  const curve = Curves.easeInOutQuart;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  var offsetAnimation = animation.drive(tween);

  return SlideTransition(position: offsetAnimation, child: child);
}
