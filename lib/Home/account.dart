import 'package:chatdb/Elements/checkinternet.dart';
import 'package:chatdb/Home/homepage.dart';
import 'package:chatdb/Elements/firebaseservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../Account/register.dart';

class AccountFragment extends StatefulWidget {
  const AccountFragment({super.key});

  @override
  AccountFragmentState createState() => AccountFragmentState();
}

class AccountFragmentState extends State<AccountFragment> {
  bool isLoading = false;
  User? user = FirebaseAuth.instance.currentUser;

  final CheckInternet c = Get.put(CheckInternet());

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

    c.checkUserConnection();

    return !isLoading
        ? Container(
            alignment: Alignment.center,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            color: Colors.green,
            child: Obx(
              () => Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0)),
                child: c.activeConnection.value
                    ? Column(children: [
                        const Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Container(
                                  width: availableHeight /
                                      6, // Set the desired diameter of the circle
                                  height: availableWidth /
                                      3, // Set the desired diameter of the circle
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors
                                        .grey, // Set the color of the circle
                                  ),
                                  child: user?.photoURL == null
                                      ? const Icon(
                                          Icons.person,
                                          color: Colors.white,
                                          size: 70,
                                        )
                                      : CircleAvatar(
                                          backgroundImage:
                                              NetworkImage(user!.photoURL!),
                                          radius: 20,
                                        ),
                                ),
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  user?.displayName == null
                                      ? 'User'
                                      : user!.displayName!,
                                  style: const TextStyle(fontSize: 18.0),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 32.0),
                            color: Colors.white,
                            child: user?.email == null
                                ? Column(children: [
                                    const Spacer(
                                      flex: 1,
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: MaterialButton(
                                          onPressed: () {},
                                          minWidth: availableWidth,
                                          color: Colors.green,
                                          child: Text(
                                            'Sign In',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: fontSize * 0.9),
                                          ),
                                        )),
                                    const Spacer(
                                      flex: 2,
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: MaterialButton(
                                          onPressed: () {
                                            Get.to(() => const RegisterPage());
                                          },
                                          minWidth: availableWidth,
                                          color: Colors.green,
                                          child: Text(
                                            'Create an Account',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: fontSize * 0.9),
                                          ),
                                        )),
                                    const Spacer(
                                      flex: 2,
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: MaterialButton(
                                          onPressed: () async {
                                            void showMessage(String message) {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title:
                                                          const Text("Error"),
                                                      content: Text(message),
                                                      actions: [
                                                        TextButton(
                                                          child:
                                                              const Text("Ok"),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        )
                                                      ],
                                                    );
                                                  });
                                            }

                                            setState(() {
                                              isLoading = true;
                                            });
                                            FirebaseService service =
                                                FirebaseService();
                                            try {
                                              await service.signInwithGoogle();
                                              Get.offAll(
                                                  () => const HomePage());
                                            } catch (e) {
                                              if (e is FirebaseAuthException) {
                                                showMessage(e.message!);
                                              }
                                            }
                                            setState(() {
                                              isLoading = false;
                                            });
                                          },
                                          color: Colors.green,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                FontAwesomeIcons.google,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 16.0),
                                                child: Text(
                                                  'Sign In with Google',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: fontSize * 0.9),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ])
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Spacer(flex: 3),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          'Signed in as \n${user!.email!}',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 2,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: MaterialButton(
                                          onPressed: () async {
                                            void showMessage(String message) {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title:
                                                          const Text("Error"),
                                                      content: Text(message),
                                                      actions: [
                                                        TextButton(
                                                          child:
                                                              const Text("Ok"),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        )
                                                      ],
                                                    );
                                                  });
                                            }

                                            setState(() {
                                              isLoading = true;
                                            });
                                            FirebaseService service =
                                                FirebaseService();
                                            try {
                                              await service.signOutFromGoogle();
                                              Get.offAll(
                                                  () => const HomePage());
                                            } catch (e) {
                                              if (e is FirebaseAuthException) {
                                                showMessage(e.message!);
                                              }
                                            }
                                            setState(() {
                                              isLoading = false;
                                            });
                                          },
                                          color: Colors.green,
                                          child: const Text(
                                            'Sign out',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 1,
                                      )
                                    ],
                                  ),
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        )
                      ])
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("No Internet Connection"),
                          MaterialButton(
                            onPressed: () {
                              c.checkUserConnection();
                            },
                            color: Colors.green,
                            child: const Text(
                              'Refresh',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
              ),
            ),
          )
        : Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              color: Colors.white,
            ));
  }
}
