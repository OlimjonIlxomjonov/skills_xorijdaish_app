import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/bloc/average/average_bloc.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/bloc/average/average_state.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/bloc/course/course_time_bloc.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/bloc/course/course_time_state.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/bloc/stats_event.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/bloc/weekly/week_bloc.dart';
import 'package:skills_xorijdaish/features/statistics/presentation/bloc/weekly/week_stats.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../widget/weekly_bar_chart_wg.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  DateTime selectedDate = DateTime.now();
  DateTime currentWeekStart = DateTime.now().subtract(
    Duration(days: DateTime.now().weekday - 1),
  );
  int visibleStartIndex = 0;

  List<DateTime> getCurrentWeekDates() {
    return List.generate(7, (i) => currentWeekStart.add(Duration(days: i)));
  }

  String getMonthName(int month) {
    const months = [
      'Yanvar',
      'Fevral',
      'Mart',
      'Aprel',
      'May',
      'Iyun',
      'Iyul',
      'Avgust',
      'Sentabr',
      'Oktabr',
      'Noyabr',
      'Dekabr',
    ];
    return months[month - 1];
  }

  void goToPreviousWeek() {
    setState(() {
      currentWeekStart = currentWeekStart.subtract(const Duration(days: 7));
      visibleStartIndex = 0;
    });
  }

  void goToNextWeek() {
    setState(() {
      currentWeekStart = currentWeekStart.add(const Duration(days: 7));
      visibleStartIndex = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<AverageBloc>().add(AverageEvent());
    context.read<WeekBloc>().add(WeekEvent());
    context.read<CourseTimeBloc>().add(CourseTimeEvent(selectedDate));
  }

  @override
  Widget build(BuildContext context) {
    final weekDates = getCurrentWeekDates();
    final selectedMonth = getMonthName(weekDates[0].month);
    final selectedYear = weekDates[0].year;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(titleText: 'Statistika', onTap: () {}),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(20)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                AppStrings.activeSessions,
                style: AppTextStyles.source.medium(
                  color: AppColors.black,
                  fontSize: 18,
                ),
              ),
              BlocBuilder<AverageBloc, AverageState>(
                builder: (context, state) {
                  if (state is AverageLoading) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: appH(10),
                            horizontal: appW(16),
                          ),
                          height: appH(35),
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                      ),
                    );
                  } else if (state is AverageError) {
                    return Text('Error');
                  } else if (state is AverageLoaded) {
                    return Text(
                      state.response.data.activeTimesInHumanReadable,
                      style: AppTextStyles.source.semiBold(
                        color: AppColors.black,
                        fontSize: 28,
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
              const SizedBox(height: 8),
              Text(
                AppStrings.dailyMidActive,
                style: AppTextStyles.source.regular(
                  color: AppColors.black,
                  fontSize: 16,
                ),
              ),
              BlocBuilder<WeekBloc, WeekStats>(
                builder: (context, state) {
                  if (state is WeekStatsLoading) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: appH(10),
                            horizontal: appW(16),
                          ),
                          height: appH(160),
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                      ),
                    );
                    ;
                  } else if (state is WeekStatsError) {
                    return Text("Xatolik: ${state.message}");
                  } else if (state is WeekStatsLoaded) {
                    final dataList = state.response.data;
                    final Map<String, double> chartData = {
                      for (var item in dataList)
                        getWeekdayLabel(item.weekday):
                            item.activeTimesInSeconds.toDouble() / 60,
                    };
                    return WeeklyBarChart(data: chartData);
                    // return Text('Test');
                  }

                  return const SizedBox.shrink();
                },
              ),

              const SizedBox(height: 24),
              Text(
                'Kurslar uchun ajratilgan vaqt',
                style: AppTextStyles.source.medium(
                  color: AppColors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: appH(20)),
              datePicker(selectedMonth, selectedYear, weekDates),
              SizedBox(height: appH(20)),
              courseTime(),
            ],
          ),
        ),
      ),
    );
  }

  Widget courseTime() {
    return BlocBuilder<CourseTimeBloc, CourseTimeState>(
      builder: (context, state) {
        if (state is CourseTimeStateLoading) {
          return SizedBox(
            height: appH(300),
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (_, __) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.textGrey, width: 0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: appH(10),
                                  horizontal: appW(16),
                                ),
                                width: appH(155),
                                decoration: BoxDecoration(color: Colors.white),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: appH(10),
                                  horizontal: appW(16),
                                ),
                                width: appH(55),
                                decoration: BoxDecoration(color: Colors.white),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: appH(40),
                              horizontal: appW(46),
                            ),
                            height: appH(80),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is CourseTimeStateError) {
          return Text('Error');
        } else if (state is CourseTimeStateLoaded) {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.response.data.length,
            itemBuilder: (context, index) {
              final time = state.response.data[index];
              return Container(
                margin: EdgeInsets.only(bottom: 20, left: 2, right: 2, top: 2),
                padding: EdgeInsets.symmetric(
                  horizontal: appW(16),
                  vertical: appH(15),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      spreadRadius: 1,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          time.title,
                          style: AppTextStyles.source.semiBold(
                            color: AppColors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          time.activeTimesInHumanReadable,
                          style: AppTextStyles.source.medium(
                            color: AppColors.textGrey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    CircularStepProgressIndicator(
                      totalSteps: 100,
                      currentStep: time.progress,
                      stepSize: 10,
                      selectedColor: AppColors.secondBlue,
                      unselectedColor: Colors.grey[200],
                      padding: 0,
                      width: appW(80),
                      height: appH(80),
                      selectedStepSize: 10,
                      roundedCap: (_, __) => true,
                      child: Center(
                        child: Text(
                          "${time.progress}%",
                          style: AppTextStyles.source.bold(
                            color: AppColors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
        return SizedBox.shrink();
      },
    );
  }

  Container datePicker(
    String selectedMonth,
    int selectedYear,
    List<DateTime> weekDates,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xffE0E0E0)),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            decoration: BoxDecoration(
              color: Color(0xffF7F7F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: goToPreviousWeek,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(Icons.chevron_left, color: Colors.grey),
                  ),
                ),
                Text(
                  '$selectedMonth, $selectedYear',
                  style: AppTextStyles.source.medium(
                    color: AppColors.textGrey,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: goToNextWeek,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(Icons.chevron_right, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (visibleStartIndex > 0)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      visibleStartIndex--;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffE0E0E0)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(
                      Icons.chevron_left,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                )
              else
                const SizedBox(width: 20),

              ...weekDates
                  .sublist(
                    visibleStartIndex,
                    (visibleStartIndex + 5).clamp(0, 7),
                  )
                  .map((date) {
                    final isSelected =
                        date.day == selectedDate.day &&
                        date.month == selectedDate.month &&
                        date.year == selectedDate.year;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDate = date;
                        });
                        context.read<CourseTimeBloc>().add(
                          CourseTimeEvent(selectedDate),
                        );
                      },
                      child: Container(
                        // width: appW(45),
                        padding: EdgeInsets.symmetric(
                          horizontal: appW(12),
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? Color(0xff003F97)
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(
                              getWeekdayLabel(date.weekday),
                              style: AppTextStyles.source.medium(
                                color:
                                    isSelected
                                        ? Colors.white
                                        : AppColors.textGrey,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '${date.day}'.padLeft(2, '0'),
                              style: AppTextStyles.source.semiBold(
                                color:
                                    isSelected ? Colors.white : AppColors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),

              if (visibleStartIndex + 5 < 7)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      visibleStartIndex++;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffE0E0E0)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                )
              else
                const SizedBox(width: 20),
            ],
          ),
        ],
      ),
    );
  }
}

String getWeekdayLabel(int weekday) {
  const labels = {
    1: 'Du',
    2: 'Se',
    3: 'Cho',
    4: 'Pa',
    5: 'Ju',
    6: 'Sha',
    0: 'Ya',
  };
  return labels[weekday] ?? 'Ya';
}
