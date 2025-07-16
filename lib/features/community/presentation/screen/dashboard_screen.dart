import 'package:auto_route/auto_route.dart';
import 'package:code_base/config/routes/app_router.gr.dart';
import 'package:code_base/core/di/di_import_path.dart';
import 'package:code_base/core/local_cache/cache_utils.dart';
import 'package:code_base/features/auth/data/req/login_request_params.dart';
import 'package:code_base/features/auth/presentation/manager/login/login_bloc.dart';
import 'package:code_base/features/auth/presentation/manager/logout/logout_bloc.dart';
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
  var logoutBloc = injector<LogoutBloc>();

  int _currentIndex = 0;

  final List<Widget> _screen = const [
    HomeScreen(),
    LoginScreen(),
  ];

  @override
  void initState() {
    logoutBloc.stream.listen((state) async {
      if (state is LogoutSuccess) {
        final cache = await CacheUtils.getInstance();
        cache.clearToken();
        AutoRouter.of(context).push(LoginRoute());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          if(index==0) {
            setState(() {
            _currentIndex = index;
          });
          }else if(index==1) {
            showLogoutDialog(context);
          }
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

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(backgroundColor: Colors.white,

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text('Logout'),
          content: Text('Are you sure, you want to logout?'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text('No'),
            ),
            ElevatedButton(
              onPressed: () async {
                logoutBloc.add(GetLogout());
                Navigator.of(dialogContext).pop();

              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

}
