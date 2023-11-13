import 'package:flutter/material.dart';
import 'package:web_app_assign/presentation/login_screen/widgets/button.dart';
import 'package:web_app_assign/presentation/login_screen/widgets/icon_avatar.dart';
import 'package:web_app_assign/presentation/login_screen/widgets/text_area.dart';

class TabViewLogin extends StatelessWidget {
  const TabViewLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.grey, Colors.grey, Colors.grey],
          )),
          child: Column(
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
