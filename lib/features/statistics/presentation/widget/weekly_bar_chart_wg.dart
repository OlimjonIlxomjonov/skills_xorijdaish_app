import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';

import '../screens/statistic_page.dart';

class WeeklyBarChart extends StatefulWidget {
  final Map<String, double> data;

  const WeeklyBarChart({super.key, required this.data});

  @override
  State<WeeklyBarChart> createState() => _WeeklyBarChartState();
}

class _WeeklyBarChartState extends State<WeeklyBarChart> {
  bool _showTopTooltip = false;
  String _tooltipText = '';
  Timer? _hideTimer;

  @override
  void dispose() {
    _hideTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double minVisibleValue = 0.5;
    final entries = widget.data.entries.toList();
    final maxY =
        (entries.isEmpty
            ? 0.0
            : entries.map((e) => e.value).reduce((a, b) => a > b ? a : b)) *
        1.2;

    final todayLabel = getWeekdayLabel(DateTime.now().weekday % 7);
    final todayIndex = entries.indexWhere((e) => e.key == todayLabel);

    return AspectRatio(
      aspectRatio: 1.7,
      child: Stack(
        children: [
          BarChart(
            BarChartData(
              maxY: maxY == 0 ? 1 : maxY,
              barTouchData: BarTouchData(
                enabled: true,
                handleBuiltInTouches: false,
                touchCallback: (event, response) {
                  _hideTimer?.cancel();

                  final spot = response?.spot;
                  if (spot == null) return;

                  final idx = spot.touchedBarGroupIndex;
                  if (idx < 0 || idx >= entries.length) return;

                  final seconds = entries[idx].value.toInt();
                  setState(() {
                    _tooltipText = formatDuration(seconds);
                    _showTopTooltip = true;
                  });

                  _hideTimer = Timer(Duration(seconds: 1), () {
                    if (mounted) setState(() => _showTopTooltip = false);
                  });
                },
              ),

              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),

              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 28,
                    getTitlesWidget: (value, meta) {
                      final idx = value.toInt();
                      if (idx < 0 || idx >= entries.length)
                        return const SizedBox();
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
                      toY: e.value == 0 ? minVisibleValue : e.value,
                      color: AppColors.secondBlue,
                      width: appW(43),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),

          // Fixed-position tooltip at the top center
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: IgnorePointer(
              ignoring: true, // let touches pass through to the chart
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 150),
                opacity: _showTopTooltip ? 1.0 : 0.0,
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondBlue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _tooltipText,
                      style: AppTextStyles.source.regular(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // your formatter (unchanged)
  String formatDuration(int seconds) {
    final duration = Duration(seconds: seconds);
    final weeks = duration.inDays ~/ 7;
    if (weeks > 0) return "$weeks hafta";
    final days = duration.inDays;
    if (days > 0) return "$days kun";
    final hours = duration.inHours;
    if (hours > 0) return "$hours soat";
    final minutes = duration.inMinutes;
    if (minutes > 0) return "$minutes daqiqa";
    return "${duration.inSeconds} soniya";
  }
}
