// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:web_app_assign/presentation/login_screen/widgets/button.dart';
import 'package:web_app_assign/presentation/login_screen/widgets/icon_avatar.dart';
import 'package:web_app_assign/presentation/login_screen/widgets/text_area.dart';

class DesktopViewLogin extends StatelessWidget {
  const DesktopViewLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/lap2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(.1),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.grey, Colors.grey, Colors.grey],
                )),
                height: MediaQuery.of(context).size.height,
                width: 300,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 120),
                      IconAvatar(
                        icon: Icons.person,
                        size: 45,
                        radius: 40,
                      ),
                      const SizedBox(height: 60),
                      TextArea(
                        name: 'Username',
                        prefixIcon: const Icon(Icons.person),
                      ),
                      const SizedBox(height: 30),
                      TextArea(
                        name: 'Password',
                        prefixIcon: const Icon(Icons.key),
                      ),
                      const SizedBox(height: 50),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                        child: ButtonChat(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
