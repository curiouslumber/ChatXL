import 'package:chatdb/Elements/firebaseservice.dart';
import 'package:chatdb/Home/homepage2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FullScreenAvatarPage extends StatefulWidget {
  const FullScreenAvatarPage({super.key});

  @override
  FullScreenAvatarPageState createState() => FullScreenAvatarPageState();
}

class FullScreenAvatarPageState extends State<FullScreenAvatarPage> {
  bool isLoading = false;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    // Responsive data
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    // ignore: unused_local_variable
    double availableWidth = mediaQueryData.size.width;
    // ignore: unused_local_variable
    double availableHeight = mediaQueryData.size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff405C5A),
        foregroundColor: Colors.white,
      ),
      body: Container(
        alignment: Alignment.center,
        color: const Color(0xff405C5A),
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 6,
                child: Hero(
                  tag: 'avatarTag',
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1), // Shadow color
                          spreadRadius:
                              5, // How far the shadow extends from the object
                          blurRadius: 4, // The radius of the shadow blur
                          offset: const Offset(
                              0, 4), // The offset of the shadow from the object
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Color(0xffD9D9D9),
                      radius: 80,
                      child: Icon(
                        Icons.person,
                        color: Color(0xff405C5A),
                        size: 60,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 2,

                // ignore: sized_box_for_whitespace
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08), // Shadow color
                        spreadRadius:
                            5, // How far the shadow extends from the object
                        blurRadius: 4, // The radius of the shadow blur
                        offset: const Offset(
                            0, 4), // The offset of the shadow from the object
                      ),
                    ],
                  ),
                  width: availableWidth,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 64.0),
                      backgroundColor: const Color(0xffD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Ubuntu',
                        color: Color(0xff034B40),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                  flex: 2,
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08), // Shadow color
                          spreadRadius:
                              5, // How far the shadow extends from the object
                          blurRadius: 4, // The radius of the shadow blur
                          offset: const Offset(
                              0, 4), // The offset of the shadow from the object
                        ),
                      ],
                    ),
                    width: availableWidth,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 64.0),
                            backgroundColor:
                                const Color.fromARGB(255, 226, 226, 226),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0))),
                        onPressed: () {},
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Ubuntu',
                            color: Color(0xff034B40),
                          ),
                        )),
                  )),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 2,
                // ignore: sized_box_for_whitespace
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08), // Shadow color
                        spreadRadius:
                            5, // How far the shadow extends from the object
                        blurRadius: 4, // The radius of the shadow blur
                        offset: const Offset(
                            0, 4), // The offset of the shadow from the object
                      ),
                    ],
                  ),
                  width: availableWidth,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 226, 226, 226),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0))),
                      onPressed: () async {
                        void showMessage(String message) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Error"),
                                  content: Text(message),
                                  actions: [
                                    TextButton(
                                      child: const Text("Ok"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              });
                        }

                        setState(() {
                          isLoading = true;
                        });
                        FirebaseService service = FirebaseService();
                        try {
                          await service.signInwithGoogle();
                          Get.offAll(() => const HomePage2());
                        } catch (e) {
                          if (e is FirebaseAuthException) {
                            showMessage(e.message!);
                          }
                        }
                        setState(() {
                          isLoading = false;
                        });
                      },
                      child: const SizedBox(
                        width: 180,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Icon(
                                FontAwesomeIcons.google,
                                color: Color(0xff034B40),
                                size: 20,
                              ),
                            ),
                            Spacer(
                              flex: 7,
                            ),
                            Expanded(
                              flex: 50,
                              child: Text(
                                'Sign In With Google',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Ubuntu',
                                  color: Color(0xff034B40),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ]),
      ),
    );
  }
}
