import 'package:chatdb/Elements/checkinternet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Chat/controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Controller c = Get.put(Controller());
  final FirebaseAuth firebase = FirebaseAuth.instance;
  final CheckInternet p = Get.put(CheckInternet());

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    // ignore: unused_local_variable
    double availableWidth = mediaQueryData.size.width;
    // ignore: unused_local_variable
    double availableHeight = mediaQueryData.size.height;

    if (c.isVisible.value == true) {
      c.isVisible.value = false;
    }

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xff405C5A),
      ),
      body: Container(
          color: const Color(0xff405C5A),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
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
                  height: availableHeight / 4,
                  child: const CircleAvatar(
                      backgroundColor: Color(0xffD9D9D9),
                      radius: 80,
                      child: Icon(
                        Icons.file_upload_outlined,
                        color: Color(0xff405C5A),
                        size: 60,
                      )),
                ),
                Container(
                  height: availableHeight / 18,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05), // Shadow color
                        spreadRadius:
                            3, // How far the shadow extends from the object
                        blurRadius: 4, // The radius of the shadow blur
                        offset: const Offset(
                            0, 4), // The offset of the shadow from the object
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  height: availableHeight / 12,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.bottom,
                    controller: usernameController,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xff034B40),
                        fontFamily: 'Ubuntu'),
                    cursorColor: const Color(0xff034B40),
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 4, 60, 52)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.2), width: 0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.2), width: 0.0),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      fillColor: const Color(0xffD9D9D9),
                      filled: true,
                    ),
                  ),
                ),
                Container(
                  height: availableHeight / 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05), // Shadow color
                        spreadRadius:
                            3, // How far the shadow extends from the object
                        blurRadius: 4, // The radius of the shadow blur
                        offset: const Offset(
                            0, 4), // The offset of the shadow from the object
                      ),
                    ],
                  ),
                  height: availableHeight / 12,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.bottom,
                    controller: emailController,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xff034B40),
                        fontFamily: 'Ubuntu'),
                    cursorColor: const Color(0xff034B40),
                    decoration: InputDecoration(
                      hintText: 'Email address',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 4, 60, 52)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.2), width: 0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.2), width: 0.0),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      fillColor: const Color(0xffD9D9D9),
                      filled: true,
                    ),
                  ),
                ),
                Container(
                  height: availableHeight / 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05), // Shadow color
                        spreadRadius:
                            3, // How far the shadow extends from the object
                        blurRadius: 4, // The radius of the shadow blur
                        offset: const Offset(
                            0, 4), // The offset of the shadow from the object
                      ),
                    ],
                  ),
                  height: availableHeight / 12,
                  child: Obx(
                    () => TextField(
                      obscureText: !c.isVisible.value ? true : false,
                      textAlignVertical: TextAlignVertical.bottom,
                      controller: passwordController,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xff034B40),
                          fontFamily: 'Ubuntu'),
                      cursorColor: const Color(0xff034B40),
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 4, 60, 52)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.2),
                                width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.2),
                                width: 0.0),
                          ),
                          disabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          fillColor: const Color(0xffD9D9D9),
                          filled: true,
                          suffixIcon: IconButton(
                            icon: Icon(
                              !c.isVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color(0xff405C5A),
                            ),
                            onPressed: () {
                              if (c.isVisible.value == false) {
                                c.isVisible.value = true;
                              } else {
                                c.isVisible.value = false;
                              }
                            },
                          )),
                    ),
                  ),
                ),
                Container(
                  height: availableHeight / 15,
                ),
                Container(
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
                  height: availableHeight / 12,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      backgroundColor: const Color(0xffD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () async {
                      var userName = "";
                      var userEmail = "";
                      var userPassword = "";

                      userName = usernameController.text.trim();
                      userEmail = emailController.text.trim();
                      userPassword = passwordController.text.trim();

                      await p.checkUserConnection();

                      if (p.activeConnection.value) {
                        if (userEmail.isEmail) {
                          var signInMethod = await firebase
                              .fetchSignInMethodsForEmail(userEmail);

                          if (signInMethod.isNotEmpty) {
                            // ignore: use_build_context_synchronously
                            var signInString = "Google Sign In";

                            if (signInMethod.first != "google.com") {
                              signInString = "User Sign In";
                            }
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("User already exists via $signInString"),
                            ));
                          } else if (userName == "" ||
                              userEmail == "" ||
                              userPassword == "") {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Missing fields"),
                            ));
                          } else if (userPassword.length < 6) {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "Password should be atleast 6 characters"),
                            ));
                          } else if ((userName != "" &&
                              userEmail != "" &&
                              userPassword != "" &&
                              userPassword.length >= 6)) {
                            await firebase
                                .createUserWithEmailAndPassword(
                                    email: userEmail, password: userPassword)
                                .then((value) => {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content:
                                            Text("Registration successful"),
                                      )),
                                    });

                            await firebase.signOut();
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Error"),
                            ));
                          }
                        } else {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Invalid Email address"),
                          ));
                        }
                      } else {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("No internet connection"),
                        ));
                      }
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Ubuntu',
                        color: Color(0xff034B40),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: availableHeight / 32,
                ),
              ],
            ),
          )),
    );
  }
}
