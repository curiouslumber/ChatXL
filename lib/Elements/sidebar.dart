import 'package:chatdb/Home/account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Responsive data
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    // ignore: unused_local_variable
    double availableWidth = mediaQueryData.size.width;
    // ignore: unused_local_variable
    double availableHeight = mediaQueryData.size.height;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff405C5A),
            ),
            child: Text(''),
          ),
          ListTile(
            horizontalTitleGap: 16.0,
            leading: const Icon(
              Icons.person,
            ),
            title: const Text(
              'Account',
              style: TextStyle(color: Color.fromARGB(255, 109, 109, 109)),
            ),
            onTap: () {
              Get.to(() => const FullScreenAvatarPage());
            },
          ),
          ListTile(
            horizontalTitleGap: 16.0,
            leading: const Icon(
              Icons.settings,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(color: Color.fromARGB(255, 109, 109, 109)),
            ),
            onTap: () {},
          ),
          ListTile(
            horizontalTitleGap: 16.0,
            leading: const Icon(
              Icons.exit_to_app,
            ),
            title: const Text(
              'Exit',
              style: TextStyle(color: Color.fromARGB(255, 109, 109, 109)),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
