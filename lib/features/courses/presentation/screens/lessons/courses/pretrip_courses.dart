import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/common/widgets/lessons/lessons_list_wg.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/pre_trip_by_country/pre_trip_by_country_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/pre_trip_courses/pre_trip_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';

import '../../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../../core/common/textstyles/app_text_styles.dart';
import '../../../../../../core/configs/assets/app_vectors.dart';

class LessonsPage extends StatefulWidget {
  final int countryId;

  const LessonsPage({super.key, required this.countryId});

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  @override
  void initState() {
    context.read<PreTripByCountryBloc>().add(
      PreTripByCountryEvent(widget.countryId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        titleText: 'Darslar',
        onTap: () {
          AppRoute.close();
        },
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 20),
        child: BlocBuilder<PreTripByCountryBloc, PreTripState>(
          builder: (context, state) {
            if (state is PreTripLoading) {
              return ListView.builder(
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
              );
            } else if (state is PreTripLoaded) {
              final isEmpty = state.response.data.isEmpty;

              if (isEmpty) {
                return Center(
                  child: Text(
                    'Hech qanday kurs topilmadi!',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                );
              }

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
                    language: preTrip.country.language,
                    courseId: preTrip.id,
                    isStarted: preTrip.isStarted,
                    isDone: preTrip.isDone,
                    priceInfo: preTrip.priceInfo.price,
                  );
                },
              );
            } else if (state is PreTripError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppVectors.warning),
                    SizedBox(height: appH(20)),
                    Text(
                      'Ogohlantirish!',
                      style: AppTextStyles.source.medium(
                        color: AppColors.black,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: appH(20)),
                    Text(
                      'Ayni damda texnik ishlar olib borilyapti! \n Noqulayliklar uchun uzur sorab qolamiz!',
                      style: AppTextStyles.source.regular(
                        color: AppColors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            }
            return Text('Fetching...');
          },
        ),
      ),
    );
  }
}
