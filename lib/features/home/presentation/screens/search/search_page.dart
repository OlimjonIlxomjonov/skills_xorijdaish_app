import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/features/home/presentation/screens/search/widget/not_found_wg.dart';
import '../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../core/common/textstyles/app_text_styles.dart';
import '../../../../../core/utils/responsiveness/app_responsive.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  final List<String> searchResults = ['Rus tili kurslari', 'Ingliz tili'];
  final List<String> searchHistory = [];

  String currentQuery = '';

  void _onSearchChanged(String query) {
    setState(() {
      currentQuery = query;
    });
  }

  void _clearHistory() {
    setState(() {
      searchHistory.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> filteredResults =
        searchResults
            .where(
              (item) => item.toLowerCase().contains(currentQuery.toLowerCase()),
            )
            .toList();

    final bool hasSearched = currentQuery.isNotEmpty;
    final bool noResults = hasSearched && filteredResults.isEmpty;

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
                  AppStrings.recentrly,
                  style: AppTextStyles.source.semiBold(
                    color: AppColors.black,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: _clearHistory,
                  child: Text(
                    AppStrings.clear,
                    style: AppTextStyles.source.semiBold(
                      color: AppColors.black,
                      fontSize: 14,
                    ),
                  ),
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

            if (searchHistory.isNotEmpty && !hasSearched)
              Column(
                children:
                    searchHistory.map((term) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(
                          Icons.watch_later_outlined,
                          color: AppColors.textGrey,
                        ),
                        title: Text(
                          term,
                          style: AppTextStyles.source.regular(
                            color: AppColors.black,
                            fontSize: 15,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            IconlyLight.close_square,
                            color: AppColors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              searchHistory.remove(term);
                            });
                          },
                        ),
                        onTap: () {
                          setState(() {
                            currentQuery = term;
                            searchController.text = term;
                          });
                        },
                      );
                    }).toList(),
              ),

            SizedBox(height: appH(10)),
            if (hasSearched)
              Expanded(
                child:
                    noResults
                        ? NotFoundWg(result: searchController.text)
                        : ListView.builder(
                          itemCount: filteredResults.length,
                          itemBuilder: (context, index) {
                            final result = filteredResults[index];
                            return ListTile(
                              title: Text(result),
                              onTap: () {
                                setState(() {
                                  if (!searchHistory.contains(result)) {
                                    searchHistory.add(result);
                                  }
                                  currentQuery = '';
                                  searchController.clear();
                                });
                                // AppRoute.go(YourResultPage());
                              },
                            );
                          },
                        ),
              ),
          ],
        ),
      ),
    );
  }
}
