// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:web_app_assign/presentation/login_screen/widgets/button.dart';

import 'package:web_app_assign/presentation/login_screen/widgets/icon_avatar.dart';
import 'package:web_app_assign/presentation/login_screen/widgets/text_area.dart';

class MobileViewLogin extends StatelessWidget {
  const MobileViewLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 140),
              IconAvatar(
                icon: Icons.person,
                size: 38,
                radius: 40,
              ),
              const SizedBox(height: 80),
              Center(
                child: TextArea(
                  name: 'Username',
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: TextArea(
                  name: 'Password',
                  prefixIcon: const Icon(Icons.key),
                ),
              ),
              const SizedBox(height: 50),
              const ButtonChat(),
            ],
          ),
        ),
      ),
    );
  }
}
