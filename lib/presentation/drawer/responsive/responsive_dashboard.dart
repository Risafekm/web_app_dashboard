import 'package:flutter/material.dart';
import 'package:web_app_assign/domain/const_screen_width.dart';
import 'package:web_app_assign/presentation/drawer/desktop_view_dashboard.dart';
import 'package:web_app_assign/presentation/drawer/mobile_view_dashboard.dart';
import 'package:web_app_assign/presentation/drawer/tab_view_dashborad.dart';

class ResponsiveDashBoard extends StatelessWidget {
  const ResponsiveDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        //mobile
        if (constraints.maxWidth < mobile_width) {
          return const MobileViewDashBoard();
        }
        // Tab
        else if (constraints.maxWidth < tab_width) {
          return const TabViewDashBoard();
        }
        //Desktop
        else {
          return const DesktopViewDashBoard();
        }
      },
    );
  }
}
