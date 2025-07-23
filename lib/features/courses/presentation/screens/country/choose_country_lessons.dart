import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skills_xorijdaish/core/common/widgets/button/basic_button_wg.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/countries/countries_bloc.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/countries/countries_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/screens/lessons/courses/pretrip_courses.dart';
import 'package:skills_xorijdaish/features/profile/presentation/screens/self_information/user_info_storage.dart';

import '../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../core/common/constants/strings/app_strings.dart';
import '../../../../../core/common/textstyles/app_text_styles.dart';
import '../../../../../core/common/textstyles/sans_text_style.dart';
import '../../../../../core/configs/assets/app_images.dart';
import '../../../../../core/utils/responsiveness/app_responsive.dart';

class ChooseCountryLessons extends StatefulWidget {
  const ChooseCountryLessons({super.key});

  @override
  State<ChooseCountryLessons> createState() => _ChooseCountryLessonsState();
}

class _ChooseCountryLessonsState extends State<ChooseCountryLessons> {
  int itemSelected = -1;
  int? selectedCount;

  @override
  void initState() {
    super.initState();
    context.read<CountriesBloc>().add(GetCountriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        toolbarHeight: appH(100),
        title: Row(
          children: [
            CircleAvatar(
              radius: appH(30),
              backgroundImage: AssetImage(AppImages.userAvatar),
            ),
            SizedBox(width: appW(10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${AppStrings.hayrliKun} 👋',
                  style: AppTextStyles.source.medium(
                    color: AppColors.grey,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: appH(10)),
                Text(
                  userInfo.fullName ?? '',
                  style: SansTextStyle().semiBold(
                    color: AppColors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: appH(10)),
            Text(
              AppStrings.davlatTanlang,
              style: AppTextStyles.source.semiBold(
                color: AppColors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(height: appH(10)),
            BlocBuilder<CountriesBloc, CountriesState>(
              builder: (context, state) {
                if (state is CountriesLoading) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: 8,
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
                              height: appH(64),
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
                } else if (state is CountriesError) {
                  return Text(
                    'Oops, something went wrong!',
                    style: TextStyle(color: Colors.red),
                  );
                } else if (state is CountriesLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: state.response.length,
                      itemBuilder: (context, index) {
                        final country = state.response[index];
                        final isSelected = itemSelected == index;
                        return Container(
                          padding: EdgeInsets.symmetric(
                            vertical: appH(10),
                            horizontal: appW(16),
                          ),
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? AppColors.secondBlue
                                    : Color(0xff080E1E0D),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                            ),
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  itemSelected = index;
                                  selectedCount = country.id;
                                });
                              },

                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey.shade100,
                                child: ClipOval(
                                  child: buildCountryIcon(country.icon),
                                ),
                              ),

                              title: Text(
                                country.title,
                                style: AppTextStyles.source.medium(
                                  color:
                                      isSelected
                                          ? AppColors.white
                                          : AppColors.black,
                                  fontSize: 16,
                                ),
                              ),
                              trailing:
                                  isSelected
                                      ? Icon(
                                        IconlyBold.tick_square,
                                        color: AppColors.white,
                                        size: appH(24),
                                      )
                                      : null,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return Text('Fetching...');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: appH(24)),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 10,
              color: Colors.grey.shade200,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: BasicButtonWg(
          text: AppStrings.contunie,
          isEnabled: selectedCount != null,
          onTap: () {
            if (selectedCount != null) {
              AppRoute.go(LessonsPage(query: 'pre-trip-courses'));
            }
          },
        ),
      ),
    );
  }

  Widget buildCountryIcon(String rawUrlOrPath) {
    final fullUrl =
        rawUrlOrPath.startsWith('http')
            ? rawUrlOrPath
            : 'https://api-skills.xorijdaish.uz/storage/$rawUrlOrPath';

    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: fullUrl,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        placeholder:
            (context, url) => const CircularProgressIndicator(strokeWidth: 2),
        errorWidget: (context, url, error) {
          debugPrint('⚠️ Image failed to load: $url\nError: $error');
          return const Icon(Icons.flag, size: 32, color: Colors.grey);
        },
      ),
    );
  }
}
