// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:web_app_assign/presentation/drawer/drawer_screens/dasshboard_desktop.dart';
import 'package:web_app_assign/presentation/drawer/drawer_screens/widgets/drawer_icon_text_desktop.dart';
import 'package:web_app_assign/presentation/drawer/logout/logoutdesktop.dart';
import 'package:web_app_assign/presentation/profile/profile_desktop.dart';

class DesktopViewDashBoard extends StatefulWidget {
  const DesktopViewDashBoard({super.key});

  @override
  State<DesktopViewDashBoard> createState() => _DesktopViewDashBoardState();
}

class _DesktopViewDashBoardState extends State<DesktopViewDashBoard> {
  int _selectedIndex = 0;

  List<Widget> pages = [
    DashBoardDesktop(),
    const Center(child: Text('Page 2')),
    const Center(child: Text('Page 3')),
    const Center(child: Text('Page 4')),
    const Center(child: Text('Page 5')),
    const Center(child: Text('Page 6')),
    const LogOutDesktop(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
        child: Row(
          children: [
            // drawer area

            Expanded(
              flex: 1,
              child: Container(
                color: Theme.of(context).colorScheme.onPrimary,
                child: ListView(
                  children: [
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 8.0,
                        top: 8,
                      ),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://tera-media.s3.amazonaws.com/service-multimedia/330000265-photo-527'),
                            )),
                      ),
                    ),
                    const SizedBox(height: 30),
                    DrawerIconTextDesktop(
                      text: 'DashBoard',
                      icon: Icons.dashboard,
                      onTap: () {
                        _onItemTapped(0);
                      },
                      selected: false,
                    ),
                    DrawerIconTextDesktop(
                      text: 'Home',
                      icon: Icons.home,
                      onTap: () {
                        _onItemTapped(1);
                      },
                      selected: _selectedIndex == 1,
                    ),
                    DrawerIconTextDesktop(
                      text: 'Profile',
                      icon: Icons.person,
                      onTap: () {
                        _onItemTapped(2);
                      },
                      selected: _selectedIndex == 2,
                    ),
                    DrawerIconTextDesktop(
                      text: 'Setting',
                      icon: Icons.settings,
                      onTap: () {
                        _onItemTapped(3);
                      },
                      selected: _selectedIndex == 3,
                    ),
                    DrawerIconTextDesktop(
                      text: 'Exercise',
                      icon: Icons.sports_gymnastics,
                      onTap: () {
                        _onItemTapped(4);
                      },
                      selected: _selectedIndex == 4,
                    ),
                    DrawerIconTextDesktop(
                      text: 'History',
                      icon: Icons.history,
                      onTap: () {
                        _onItemTapped(5);
                      },
                      selected: _selectedIndex == 5,
                    ),
                    DrawerIconTextDesktop(
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
            ),

            // center screen
            Expanded(
              flex: 5,
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: pages[_selectedIndex],
              ),
            ),

            // profile area

            Expanded(
              flex: 2,
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: const ProfileDesktop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
