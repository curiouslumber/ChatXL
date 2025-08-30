import 'package:chatdb/Chat/controller.dart';
import 'package:chatdb/Home/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountHandler {
  void registerHandler(BuildContext context, FirebaseAuth firebase,
      String userName, String userEmail, String userPassword) async {
    if (userEmail.isEmail) {
      // var signInMethod = await firebase.fetchSignInMethodsForEmail(userEmail);
      var signInMethod = [];

      if (signInMethod.isNotEmpty) {
        // ignore: use_build_context_synchronously
        var signInString = "Google Sign In";

        if (signInMethod.first != "google.com") {
          signInString = "User Sign In";
        }
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("User already exists via $signInString"),
        ));
      } else if (userName == "" || userEmail == "" || userPassword == "") {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Missing fields"),
        ));
      } else if (userPassword.length < 6) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Password should be atleast 6 characters"),
        ));
      } else if ((userName != "" &&
          userEmail != "" &&
          userPassword != "" &&
          userPassword.length >= 6)) {
        await firebase
            .createUserWithEmailAndPassword(
                email: userEmail, password: userPassword)
            .then((value) => {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Registration successful"),
                  )),
                });

        FirebaseFirestore.instance.collection("users").doc(userEmail).set({
          "userName": userName,
          "userEmail": userEmail,
          "createdAt": DateTime.now()
        });
        await firebase.signOut();
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Error"),
        ));
      }
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Invalid Email address"),
      ));
    }
  }

  void loginHandler(
      BuildContext context, String userEmail, String userPassword) async {
    if (userEmail != "" && userPassword != "") {
      if (userEmail.isEmail) {
        // var signInMethod =
        //     await FirebaseAuth.instance.fetchSignInMethodsForEmail(userEmail);
        var signInMethod = [];

        if (signInMethod.isNotEmpty) {
          try {
            await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: userEmail, password: userPassword);
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Logged In")));

            Get.offAll(() => const HomePage());
          } catch (e) {
            // ignore: avoid_print
            print(e.toString());

            var error = e.toString();
            if (error.contains("firebase_auth/wrong-password")) {
              if (signInMethod.contains("google.com")) {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Invalid Password. Google Account"),
                ));
              } else {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Invalid Password."),
                ));
              }
            }
          }
        } else {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("User doesn't exist. Please register."),
          ));
        }
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Invalid Email address"),
        ));
      }
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Missing Fields"),
      ));
    }
  }

  void accountHandler(String documentID) async {
    Controller c = Get.put(Controller());

    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(documentID)
          .get();

      if (documentSnapshot.exists) {
        // Document exists, retrieve its data
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        String field1Value = data['userName'];
        c.displayName.value = field1Value;
      } else {
        // ignore: avoid_print
        print('Document does not exist');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error retrieving data: $e');
    }
  }
}
