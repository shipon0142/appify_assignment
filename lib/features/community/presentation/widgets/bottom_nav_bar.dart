import 'package:flutter/material.dart';

import '../../../auth/presentation/screen/login_screen.dart';
import '../screen/home_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  int _currentIndex = 0;

  final List<Widget> _screen = const [
    HomeScreen(),
    LoginScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        elevation: 4,
        // currentIndex: /*controller.currentSelectedIndex*/,
        // onTap: /*controller.changeIndex,*/,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Community"),
          BottomNavigationBarItem(
              icon: Icon(Icons.logout_rounded), label: "Logout"),
        ],
      ),
    );
  }
}