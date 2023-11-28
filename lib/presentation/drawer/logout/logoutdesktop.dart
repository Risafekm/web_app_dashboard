import 'package:flutter/material.dart';
import 'package:web_app_assign/application/services/Api_methods.dart';

class LogOutDesktop extends StatelessWidget {
  const LogOutDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Api.signOut();
            },
            child: const Text('LOgOut')),
      ),
    );
  }
}
