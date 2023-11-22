import 'package:flutter/material.dart';
import 'package:web_app_assign/application/services/methods.dart';

class LogOutMobile extends StatelessWidget {
  const LogOutMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              signOut();
            },
            child: const Text('LOgOut')),
      ),
    );
  }
}
