// ignore_for_file: sized_box_for_whitespace

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartLineWidget extends StatelessWidget {
  const ChartLineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      // color: Colors.red.shade100,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
                barWidth: 2,
                color: Theme.of(context).colorScheme.primary,
                isCurved: true,
                spots: const [
                  FlSpot(0, 0),
                  FlSpot(2, 3),
                  FlSpot(4, 1),
                  FlSpot(5, 3),
                  FlSpot(6, 1),
                  FlSpot(7, 7),
                ]),
          ],
        ),
        duration: const Duration(milliseconds: 150),
        curve: Curves.linear,
      ),
    );
  }
}
