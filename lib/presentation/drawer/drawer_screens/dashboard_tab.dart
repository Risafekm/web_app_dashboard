// ignore_for_file: sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app_assign/presentation/drawer/drawer_screens/widgets/chart/bar_chart.dart';
import 'package:web_app_assign/presentation/drawer/drawer_screens/widgets/chart/line_chart_widget.dart';
import 'package:web_app_assign/presentation/drawer/drawer_screens/widgets/listbox/list_box_tab.dart';

class DashBoardTab extends StatelessWidget {
  DashBoardTab({super.key});

  TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //search bar
              searchBox(context),

              const SizedBox(height: 10),

              //listView card
              const ListBoxTab(),
              const SizedBox(height: 20),

              //chart area
              const ChartLineWidget(),

              //Bar chart

              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                        child: BarChartSample3(
                      titleBarChart: 'Activity level',
                    )),
                    const SizedBox(width: 10),
                    Expanded(
                        child: BarChartSample3(
                      titleBarChart: 'Nutrition',
                    )),
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  //search bar

  Widget searchBox(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.primary,
        ),
        height: 45,
        child: TextField(
          cursorColor: Theme.of(context).colorScheme.tertiary,
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).colorScheme.tertiary,
            fontWeight: FontWeight.w400,
          ),
          showCursor: true,
          controller: searchText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 25,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.primary,
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
            prefixIconColor: Theme.of(context).colorScheme.tertiary,
            hintStyle: GoogleFonts.lora(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ),
      ),
    );
  }
}
