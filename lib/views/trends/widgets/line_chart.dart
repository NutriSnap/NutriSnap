import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

const List<FlSpot> chartData = [
  FlSpot(0, 1),
  FlSpot(1, 3),
  FlSpot(2, 10),
  FlSpot(3, 7),
  FlSpot(4, 12),
  FlSpot(5, 13),
  FlSpot(6, 17),
  FlSpot(7, 15),
  FlSpot(8, 20),
];

const List<FlSpot> chartData2 = [
  FlSpot(0, 0),
  FlSpot(1, 2),
  FlSpot(2, 7),
  FlSpot(3, 5),
  FlSpot(4, 3),
  FlSpot(5, 4),
  FlSpot(6, 5),
  FlSpot(7, 5),
  FlSpot(8, 8),
];

const List<FlSpot> chartData3 = [
  FlSpot(0, 15),
  FlSpot(1, 13),
  FlSpot(2, 10),
  FlSpot(3, 8),
  FlSpot(4, 9),
  FlSpot(5, 9),
  FlSpot(6, 7),
  FlSpot(7, 6),
  FlSpot(8, 8),
];

class FoodCategoryTrendsChart extends StatefulWidget {
  const FoodCategoryTrendsChart({Key? key}) : super(key: key);

  @override
  State<FoodCategoryTrendsChart> createState() =>
      _FoodCategoryTrendsChartState();
}

class _FoodCategoryTrendsChartState extends State<FoodCategoryTrendsChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 300,
      child: LineChart(
        LineChartData(
            gridData: const FlGridData(show: false),
            titlesData: const FlTitlesData(
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: true)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                  spots: chartData, isCurved: true, color: Colors.yellow),
              LineChartBarData(
                  spots: chartData2, isCurved: true, color: Colors.green),
              LineChartBarData(
                  spots: chartData3, isCurved: true, color: Colors.red),
            ]),
      ),
    );
  }
}
