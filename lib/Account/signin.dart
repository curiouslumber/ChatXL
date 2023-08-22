import 'package:chatdb/Chat/controller.dart';
import 'package:chatdb/Elements/checkinternet.dart';
import 'package:chatdb/Home/accounthandler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Controller c = Get.put(Controller());
  final CheckInternet p = Get.put(CheckInternet());

  @override
  Widget build(BuildContext context) {
    // Responsive data
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    // ignore: unused_local_variable
    double availableWidth = mediaQueryData.size.width;
    // ignore: unused_local_variable
    double availableHeight = mediaQueryData.size.height;

    if (c.isVisible.value) {
      c.isVisible.value = false;
    }

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xff405C5A),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        color: const Color(0xff405C5A),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: availableHeight / 24,
              ),
              Container(
                height: availableHeight / 4,
                padding: const EdgeInsets.only(left: 8.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Welcome\nBack',
                  style: TextStyle(
                      fontFamily: 'Ubuntu', fontSize: 28, color: Colors.white),
                ),
              ),
              Container(
                height: availableHeight / 24,
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
                height: availableHeight / 10,
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
                    hintStyle:
                        const TextStyle(color: Color.fromARGB(255, 4, 60, 52)),
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
                height: availableHeight / 10,
                child: Obx(
                  () => TextField(
                    textAlignVertical: TextAlignVertical.bottom,
                    controller: passwordController,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xff034B40),
                        fontFamily: 'Ubuntu'),
                    cursorColor: const Color(0xff034B40),
                    obscureText: !c.isVisible.value ? true : false,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          c.isVisible.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: const Color(0xff405C5A),
                        ),
                        onPressed: () {
                          if (c.isVisible.value) {
                            c.isVisible.value = false;
                          } else {
                            c.isVisible.value = true;
                          }
                        },
                      ),
                      hintText: 'Password',
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
                    foregroundColor: const Color(0xff405C5A),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    backgroundColor: const Color(0xffD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onPressed: () async {
                    var userEmail = emailController.text.trim();
                    var userPassword = passwordController.text.trim();

                    await p.checkUserConnection();

                    if (p.activeConnection.value) {
                      AccountHandler handler = AccountHandler();
                      // ignore: use_build_context_synchronously
                      handler.loginHandler(context, userEmail, userPassword);
                    } else {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("No internet connection"),
                      ));
                    }
                  },
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
              Container(
                height: availableHeight / 40,
              ),
              Container(
                height: availableHeight / 12,
                alignment: Alignment.center,
                // color: Colors.white,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xff405C5A),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      backgroundColor: const Color(0xffD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () async {
                      var userEmail = emailController.text.trim();

                      await p.checkUserConnection();

                      if (p.activeConnection.value) {
                        if (userEmail != "") {
                          if (userEmail.isEmail) {
                            var signInMethod = await FirebaseAuth.instance
                                .fetchSignInMethodsForEmail(userEmail);
                            if (signInMethod.isNotEmpty) {
                              // Get.to(() => const EmailLinkPage());
                            } else {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Email not registered"),
                              ));
                            }
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Invalid Email"),
                            ));
                          }
                        } else {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Email Field missing"),
                          ));
                        }
                      } else {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("No connection"),
                        ));
                      }
                    },
                    child: const Text(
                      'Sign In Via Email Link',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Ubuntu',
                        color: Color(0xff034B40),
                      ),
                    )),
              ),
              Container(
                height: availableHeight / 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
