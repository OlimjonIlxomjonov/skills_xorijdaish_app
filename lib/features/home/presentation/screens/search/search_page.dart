import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/foreign_language/foreign_language_entity.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/home_event.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/search/search_bloc.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/search/search_state.dart';
import 'package:skills_xorijdaish/features/home/presentation/screens/search/widget/not_found_wg.dart';
import '../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../core/common/textstyles/app_text_styles.dart';
import '../../../../../core/common/widgets/button/basic_button_wg.dart';
import '../../../../../core/configs/assets/app_vectors.dart';
import '../../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../../courses/presentation/screens/single_course/single_course_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();

  void _onSearchChanged(String query) {
    setState(() {});
    context.read<SearchBloc>().add(SearchEvent(query));
  }

  @override
  void initState() {
    super.initState();
    context.read<SearchBloc>().add(SearchEvent(''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        titleText: AppStrings.search,
        onTap: () {
          AppRoute.close();
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(20), vertical: appH(20)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, top: 4, right: 5),
              height: appH(50),
              decoration: BoxDecoration(
                color: const Color(0xffF7F7F8),
                borderRadius: BorderRadius.circular(14),
              ),
              child: TextField(
                controller: searchController,
                onChanged: _onSearchChanged,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  icon: const Icon(IconlyLight.search),
                  hintText: AppStrings.izlash,
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: appH(20)),
            Row(
              children: [
                Text(
                  'Natija "${searchController.text}"',
                  style: AppTextStyles.source.semiBold(
                    color: AppColors.black,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoaded) {
                      final count = state.response.data.allCourses.length;
                      return Text(
                        "$count ta",
                        style: AppTextStyles.source.medium(
                          color: AppColors.grey,
                          fontSize: 14,
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
            SizedBox(height: appH(10)),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 1,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromRGBO(12, 18, 33, 0.0),
                    Color.fromRGBO(12, 18, 33, 0.2),
                    Color.fromRGBO(12, 18, 33, 0.0),
                  ],
                  stops: [0.0, 0.5043, 1.0],
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is SearchLoaded) {
                    final allCourses = state.response.data.allCourses;
                    if (allCourses.isEmpty) {
                      return NotFoundWg(result: searchController.text);
                    }
                    return ListView.builder(
                      itemCount: allCourses.length,
                      itemBuilder: (context, index) {
                        final courses = allCourses[index];
                        return buildContainer(courses.course);
                      },
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainer(dynamic search) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, top: 9, bottom: 16),
      margin: EdgeInsets.only(bottom: appH(20)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child:
                search.isDone
                    ? Stack(
                      children: [
                        Image.network(
                          search.imageUrl,
                          width: appW(372),
                          height: appH(164),
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Container(
                              width: appW(372),
                              height: appH(164),
                              alignment: Alignment.center,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: appH(10),
                                    horizontal: appW(16),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: appW(372),
                              height: appH(164),
                              color: Colors.grey.shade200,
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.broken_image,
                                size: 40,
                                color: Colors.grey,
                              ),
                            );
                          },
                        ),
                        Container(
                          width: double.infinity,
                          height: appH(164),
                          color: Colors.black.withAlpha(150),
                          child: SvgPicture.asset(
                            AppVectors.certificate,
                            fit: BoxFit.none,
                          ),
                        ),
                      ],
                    )
                    : Image.network(
                      search.imageUrl,
                      width: appW(372),
                      height: appH(164),
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          width: appW(372),
                          height: appH(164),
                          alignment: Alignment.center,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: appH(10),
                                horizontal: appW(16),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: appW(372),
                          height: appH(164),
                          color: Colors.grey.shade200,
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.broken_image,
                            size: 40,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
          ),
          Text(
            search.title,
            style: AppTextStyles.source.semiBold(
              color: AppColors.black,
              fontSize: 16,
            ),
          ),
          Row(
            spacing: 10,
            children: [
              SvgPicture.asset(AppVectors.star),
              Text(
                search.stars,
                style: AppTextStyles.source.medium(
                  color: AppColors.black,
                  fontSize: 13,
                ),
              ),
              SizedBox(width: appW(3)),
              SvgPicture.asset(AppVectors.documentText),
              Text(
                "${search.filesCount} ta video",
                style: AppTextStyles.source.medium(
                  color: AppColors.black,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 1,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(12, 18, 33, 0.0),
                  Color.fromRGBO(12, 18, 33, 0.2),
                  Color.fromRGBO(12, 18, 33, 0.0),
                ],
                stops: [0.0, 0.5043, 1.0],
              ),
            ),
          ),
          BasicButtonWg(
            text: AppStrings.start,
            onTap: () {
              AppRoute.go(SingleCoursePage(courseId: search.id));
            },
          ),
        ],
      ),
    );
  }
}
