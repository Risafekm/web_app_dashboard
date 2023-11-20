// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app_assign/presentation/dash_borad/pages/dashboard_mobile.dart';
import 'package:web_app_assign/presentation/dash_borad/widgets/drawer_icon_text.dart';
import 'package:web_app_assign/presentation/profile/profile.dart';

class MobileViewDashBoard extends StatefulWidget {
  const MobileViewDashBoard({super.key});

  @override
  State<MobileViewDashBoard> createState() => _MobileViewDashBoardState();
}

class _MobileViewDashBoardState extends State<MobileViewDashBoard> {
  int _selectedIndex = 0;

  List<Widget> pages = [
    DashBoardMobile(),
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
        backgroundColor: Theme.of(context).colorScheme.background,
        child: ListView(
          children: [
            const SizedBox(height: 25),
            Container(
              height: 90,
              width: 90,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://tera-media.s3.amazonaws.com/service-multimedia/330000265-photo-527'),
                  )),
            ),
            const SizedBox(height: 50),
            // DrawerHeader(
            //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            //   child: Text(
            //     'Drawer',
            //     style: GoogleFonts.acme(
            //         fontSize: 30,
            //         color: Theme.of(context).colorScheme.secondary),
            //   ),
            // ),
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
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      backgroundColor: Theme.of(context).colorScheme.background,
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Profile()));
          },
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
