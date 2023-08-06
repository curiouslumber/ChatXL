import 'package:chatdb/Elements/sidebar.dart';
import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  HomePage2State createState() => HomePage2State();
}

class HomePage2State extends State<HomePage2> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xffFFCFA3)),
        centerTitle: true,
        title: const Text(
          'ChatDB',
          style: TextStyle(
            fontFamily: 'Ubuntu',
            color: Color(0xffFFCFA3),
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color(0xff405C5A),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12.0),
            child: const Icon(
              Icons.settings,
            ),
          )
        ],
      ),
      body: Column(children: [
        Expanded(
          flex: 4,
          child: Container(color: const Color(0xff405C5A)),
        ),
        Container(
          color: const Color(0xff405C5A),
          alignment: Alignment.center,
          child: CurvedBottomNavigationBarContainer(
            height:
                120.0, // Set the desired height of the curved bottom navigation bar
            color: const Color.fromARGB(255, 195, 204, 202),
            selectedIndex: _selectedIndex,
            onTabChanged: _onItemTapped,
            // Set the color of the curved bottom navigation bar
          ),
        ),
      ]),
    );
  }
}

class CurvedBottomNavigationBarContainer extends StatelessWidget {
  final double height;
  final Color color;
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  const CurvedBottomNavigationBarContainer({
    super.key,
    required this.height,
    required this.color,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedTopClipper(),
      child: Container(
        height: height,
        color: color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Transform.translate(
              offset: const Offset(0, 16), // Adjust the margin as needed
              child: BottomNavItem(
                icon: Icons.chat,
                label: ' Chats ',
                isSelected: selectedIndex == 0,
                onTap: () => onTabChanged(0),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, 10), // Adjust the margin as needed
              child: BottomNavItem(
                icon: Icons.home,
                label: 'Home',
                isSelected: selectedIndex == 1,
                onTap: () => onTabChanged(1),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, 16), // Adjust the margin as needed
              child: BottomNavItem(
                icon: Icons.table_chart,
                label: 'Sheets',
                isSelected: selectedIndex == 2,
                onTap: () => onTabChanged(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double avatarRadius = isSelected ? 32.0 : 24.0;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            elevation: 4.0, // Adjust the elevation to set the shadow effect
            shape: const CircleBorder(),
            child: CircleAvatar(
              radius: avatarRadius,
              backgroundColor: isSelected
                  ? const Color(0xff034B40)
                  : const Color(0xff405C5A),
              child: Icon(
                icon,
                color:
                    isSelected ? Colors.white : Colors.white.withOpacity(0.85),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Ubuntu',
              color: isSelected
                  ? const Color(0xff034B40)
                  : const Color(0xff405C5A),
            ),
          ),
        ],
      ),
    );
  }
}

class CurvedTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double curveHeight = 36.0; // Adjust the curve height as needed
    Path path = Path();
    path.lineTo(0, curveHeight);
    path.quadraticBezierTo(size.width / 2, 0, size.width, curveHeight);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}