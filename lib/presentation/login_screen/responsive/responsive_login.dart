import 'package:flutter/material.dart';
import 'package:web_app_assign/domain/const_screen_width.dart';
import 'package:web_app_assign/presentation/login_screen/desktop_view_login.dart';
import 'package:web_app_assign/presentation/login_screen/mobile_view_login.dart';
import 'package:web_app_assign/presentation/login_screen/tab_view_login.dart';

class ResponsiveLogin extends StatelessWidget {
  const ResponsiveLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        //mobile
        if (constraints.maxWidth < mobile_width) {
          return MobileViewLogin();
        }
        // Tab
        else if (constraints.maxWidth < tab_width) {
          return TabViewLogin();
        }
        //Desktop
        else {
          return DesktopViewLogin();
        }
      },
    );
  }
}
