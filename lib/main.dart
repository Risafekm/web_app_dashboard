import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app_assign/application/provider/theme_provider.dart';
import 'package:web_app_assign/presentation/login_screen/responsive/responsive_login.dart';
// import 'package:web_app_assign/presentation/login_screen/responsive/responsive_login.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      // darkTheme: darkMode,
      home: const ResponsiveLogin(),
    );
  }
}
