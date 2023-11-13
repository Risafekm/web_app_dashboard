import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app_assign/presentation/dash_borad/pages/dashboard_tab.dart';
import 'package:web_app_assign/presentation/dash_borad/widgets/drawer_icon_text.dart';
import 'package:web_app_assign/presentation/profile/profile.dart';

class TabViewDashBoard extends StatefulWidget {
  const TabViewDashBoard({super.key});

  @override
  State<TabViewDashBoard> createState() => _TabViewDashBoardState();
}

class _TabViewDashBoardState extends State<TabViewDashBoard> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    DashBoardTab(),
    const Text('Page 2'),
    const Text('Page 3'),
    const Text('Page 4'),
    const Text('Page 5'),
    const Text('Page 6'),
    const Text('Page 7'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),

      //drawer

      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Text(
                'Drawer',
                style: GoogleFonts.acme(fontSize: 30, color: Colors.black),
              ),
            ),
            DrawerIconText(
              text: 'DashBoard',
              icon: Icons.dashboard,
              onTap: () {
                _onItemTapped(0);
              },
              selected: false,
            ),
            DrawerIconText(
              text: 'Home',
              icon: Icons.home,
              onTap: () {
                _onItemTapped(1);
              },
              selected: _selectedIndex == 1,
            ),
            DrawerIconText(
              text: 'Profile',
              icon: Icons.person,
              onTap: () {
                _onItemTapped(2);
              },
              selected: _selectedIndex == 2,
            ),
            DrawerIconText(
              text: 'Setting',
              icon: Icons.settings,
              onTap: () {
                _onItemTapped(3);
              },
              selected: _selectedIndex == 3,
            ),
            DrawerIconText(
              text: 'Exercise',
              icon: Icons.sports_gymnastics,
              onTap: () {
                _onItemTapped(4);
              },
              selected: _selectedIndex == 4,
            ),
            DrawerIconText(
              text: 'History',
              icon: Icons.history,
              onTap: () {
                _onItemTapped(5);
              },
              selected: _selectedIndex == 5,
            ),
            DrawerIconText(
              text: 'Logout',
              icon: Icons.logout,
              onTap: () {
                _onItemTapped(6);
              },
              selected: _selectedIndex == 6,
            ),
          ],
        ),
      ),
      body: pages[_selectedIndex],
    );
  }

  AppBar appBar() {
    return AppBar(
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Profile()));
          },
          child: const CircleAvatar(
            child: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}