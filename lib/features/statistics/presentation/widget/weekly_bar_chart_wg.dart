import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';

import '../screens/statistic_page.dart';

class WeeklyBarChart extends StatelessWidget {
  final Map<String, double> data;

  const WeeklyBarChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final entries = data.entries.toList();
    final maxY =
        entries.map((e) => e.value).reduce((a, b) => a > b ? a : b) * 1.2;

    final todayLabel = getWeekdayLabel(DateTime.now().weekday % 7);
    final todayIndex = entries.indexWhere((e) => e.key == todayLabel);

    return AspectRatio(
      aspectRatio: 1.7,
      child: BarChart(
        BarChartData(
          maxY: maxY,
          barTouchData: BarTouchData(enabled: false),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),

          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                getTitlesWidget: (value, meta) {
                  final idx = value.toInt();
                  if (idx < 0 || idx >= entries.length) {
                    return const SizedBox();
                  }
                  final isToday = idx == todayIndex;
                  final dayLabel = isToday ? 'Bugun' : entries[idx].key;
                  return Text(
                    dayLabel,
                    style: AppTextStyles.source.regular(
                      color: isToday ? AppColors.black : AppColors.textGrey,
                      fontSize: 12,
                    ),
                  );
                },
              ),
            ),
          ),

          barGroups: List.generate(entries.length, (i) {
            final e = entries[i];
            return BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  toY: e.value,
                  color: AppColors.secondBlue,
                  width: appW(43),
                  borderRadius: BorderRadius.circular(6),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
