import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountFragment extends StatefulWidget {
  const AccountFragment({super.key});

  @override
  AccountFragmentState createState() => AccountFragmentState();
}

class AccountFragmentState extends State<AccountFragment> {
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

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      color: Colors.green,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
        child: Column(children: [
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
                      color: Colors.grey, // Set the color of the circle
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 70,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                const Expanded(
                  flex: 3,
                  child: Text(
                    'User',
                    style: TextStyle(fontSize: 18.0),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              color: Colors.white,
              child: Column(children: [
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
                            color: Colors.white, fontSize: fontSize * 0.9),
                      ),
                    )),
                const Spacer(
                  flex: 2,
                ),
                Expanded(
                    flex: 3,
                    child: MaterialButton(
                      onPressed: () {},
                      minWidth: availableWidth,
                      color: Colors.green,
                      child: Text(
                        'Create an Account',
                        style: TextStyle(
                            color: Colors.white, fontSize: fontSize * 0.9),
                      ),
                    )),
                const Spacer(
                  flex: 2,
                ),
                Expanded(
                    flex: 3,
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.green,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            FontAwesomeIcons.google,
                            color: Colors.white,
                            size: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 16.0),
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
              ]),
            ),
          ),
          const Spacer(
            flex: 1,
          )
        ]),
      ),
    );
  }
}
