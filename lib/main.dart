import 'package:flutter/material.dart';
import 'package:web_app_assign/presentation/login_screen/responsive/responsive_login.dart';
// import 'package:web_app_assign/presentation/login_screen/responsive/responsive_login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white70),
        drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
      ),
      home: const ResponsiveLogin(),
    );
  }
}
