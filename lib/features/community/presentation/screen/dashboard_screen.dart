import 'package:auto_route/auto_route.dart';
import 'package:code_base/core/di/di_import_path.dart';
import 'package:code_base/features/auth/data/req/login_request_params.dart';
import 'package:code_base/features/auth/presentation/manager/login_bloc.dart';
import 'package:code_base/features/auth/presentation/screen/login_screen.dart';
import 'package:code_base/features/community/presentation/manager/community/community_bloc.dart';
import 'package:code_base/features/community/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/utility/constants/color_manager.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var loginBloc = injector<LoginBloc>();

  int _currentIndex = 0;

  final List<Widget> _screen = const [
  HomeScreen(),
  LoginScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Community"),
          BottomNavigationBarItem(
              icon: Icon(Icons.logout_rounded), label: "Logout"),
        ],
      ),
    );
  }
}
