// ignore_for_file: sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app_assign/presentation/dash_borad/widgets/chart/bar_chart.dart';
import 'package:web_app_assign/presentation/dash_borad/widgets/chart/line_chart_widget.dart';
import 'package:web_app_assign/presentation/dash_borad/widgets/listbox/list_box_desktop.dart';

class DashBoardDesktop extends StatelessWidget {
  DashBoardDesktop({super.key});

  TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Column(children: [
          //search bar
          searchBox(),

          const SizedBox(height: 10),

          //listView card
          const ListBoxDesktop(),
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

  Widget searchBox() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade700,
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.grey.shade500,
          //       spreadRadius: 2,
          //       offset: const Offset(0.0, 2),
          //       blurRadius: 5),
          // ],
        ),
        height: 45,
        child: TextField(
          cursorColor: Colors.white,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
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
            fillColor: Colors.grey.shade700,
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
            prefixIconColor: Colors.white,
            hintStyle: GoogleFonts.lora(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
