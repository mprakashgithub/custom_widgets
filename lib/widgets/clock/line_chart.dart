import 'package:clokworx/view/app_data/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PerformanceChart extends StatelessWidget {
  PerformanceChart({Key? key}) : super(key: key);

  final List<Color> gradientColors = [
    AppColors.textPerformance,
    AppColors.textPerformance,
  ];

  @override
  Widget build(BuildContext context) => Container(
        color: AppColors.black,
        child: LineChart(
          LineChartData(
            // extraLinesData: ExtraLinesData.lerp( , b, t),
            minX: 0,
            maxX: 5,
            minY: 0,
            maxY: 6,
            // backgroundColor: AppColors.backgroundDark,
            // lineTouchData: LineTouchData(enabled: false, ),

            // titlesData: LineTitles.getTitleData(),

            gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 0,
                );
              },
              drawVerticalLine: true,
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 0,
                );
              },
            ),
            borderData: FlBorderData(
              show: false,
              border: Border.all(color: AppColors.backgroundDark, width: 0),
            ),
            // titlesData: FlTitlesData.,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  const FlSpot(0, 2),
                  const FlSpot(1, 3.5),
                  const FlSpot(2, 2.5),
                  const FlSpot(3, 5),
                  const FlSpot(4, 2),
                  const FlSpot(5, 5),
                ],
                isCurved: true,
                color: AppColors.textPerformance,
                barWidth: 2,
                // dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: false,
                  color: AppColors.profileClipBg,
                ),
              ),
            ],
          ),
        ),
      );
}
