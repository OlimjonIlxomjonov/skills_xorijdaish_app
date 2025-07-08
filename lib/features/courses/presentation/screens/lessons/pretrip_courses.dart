import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/common/widgets/button/basic_button_wg.dart';
import 'package:skills_xorijdaish/core/common/widgets/lessons/lessons_list_wg.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_images.dart';
import 'package:skills_xorijdaish/core/page_route/bottom_nav_wrapper.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/pre_trip_courses/pre_trip_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/pre_trip_courses/pre_trip_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/single_course/single_course_buy.dart';

class LessonsPage extends StatefulWidget {
  final String query;
  final int countryId;

  const LessonsPage({super.key, required this.query, required this.countryId});

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  @override
  void initState() {
    context.read<PreTripBloc>().add(
      PreTripEvent(widget.query, widget.countryId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavWrapper(
      initialIndex: 2,
      appBar: CustomAppBar(
        titleText: 'Darslar',
        onTap: () {
          AppRoute.close();
        },
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 20),
        child: BlocBuilder<PreTripBloc, PreTripState>(
          builder: (context, state) {
            if (state is PreTripLoading) {
              return Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
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
                          height: appH(300),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (state is PreTripLoaded) {
              return ListView.builder(
                itemCount: state.response.data.length,
                itemBuilder: (context, index) {
                  final preTrip = state.response.data[index];
                  return LessonsListWg(
                    title: preTrip.title,
                    fileCount: preTrip.filesCount,
                    stars: preTrip.stars,
                    image: preTrip.imageUrl,
                    videoCount: preTrip.lessonsCount,
                  );
                },
              );
            } else if (state is PreTripError) {
              return Text(state.message);
            }
            return Text('Fetching...');
          },
        ),
      ),
    );
  }
}
