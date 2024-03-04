import 'package:finance_app/features/bar_graph/bar_data.dart';
import 'package:finance_app/res/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeekBarGraph extends StatelessWidget {
  final BarData barData;
  final double? maxY;
  const WeekBarGraph({super.key, required this.barData, required this.maxY});

  @override
  Widget build(BuildContext context) {
    return BarChart(BarChartData(
        maxY: maxY ?? 100,
        minY: 0,
        backgroundColor: AppColors.darkBlue,
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        barGroups: barData.graphData
            .map((data) => BarChartGroupData(x: data.x, barRods: [
                  BarChartRodData(
                      toY: data.y,
                      color: AppColors.grey,
                      width: 16,
                      borderRadius: BorderRadius.circular(4))
                ]))
            .toList()));
  }
}
