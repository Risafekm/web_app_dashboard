// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app_assign/application/provider/theme_provider.dart';
import 'package:web_app_assign/presentation/drawer/responsive/responsive_dashboard.dart';
import 'package:web_app_assign/presentation/login_screen/responsive/responsive_login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final navigatorkey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      navigatorKey: navigatorkey,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      // home: const MainScreen(),
      home: ResponsiveDashBoard(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      body: StreamBuilder<User?>(
          stream: auth.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error detected'));
            } else if (snapshot.hasData) {
              return const ResponsiveDashBoard();
            } else {
              return const ResponsiveLogin();
            }
          }),
    );
  }
}
