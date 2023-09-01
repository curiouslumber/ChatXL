import 'package:flutter/material.dart';

class EmailLinkPage extends StatelessWidget {
  const EmailLinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff405C5A),
        foregroundColor: Colors.white,
      ),
      body: Container(
          color: const Color(0xff405C5A),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'An email has been sent \nto your registered email address. \n\n',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontFamily: 'Ubuntu'),
                  ),
                )
              ])),
    );
  }
}
