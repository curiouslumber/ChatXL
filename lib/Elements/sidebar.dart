import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text(''),
          ),
          ListTile(
            horizontalTitleGap: 4.0,
            leading: const Icon(
              Icons.search,
            ),
            title: const Text(
              'Search History',
              style: TextStyle(color: Color.fromARGB(255, 109, 109, 109)),
            ),
            onTap: () {},
          ),
          ListTile(
            horizontalTitleGap: 4.0,
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
            horizontalTitleGap: 4.0,
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
