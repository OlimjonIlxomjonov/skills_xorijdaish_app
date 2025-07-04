import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/button/basic_button_wg.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';

class TestsPage extends StatelessWidget {
  const TestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          style: IconButton.styleFrom(highlightColor: Colors.transparent),
          onPressed: () {
            AppRoute.close();
          },
          icon: Icon(IconlyLight.arrow_left),
        ),
        toolbarHeight: 30,
        backgroundColor: AppColors.white,
        title: LinearPercentIndicator(
          padding: EdgeInsets.zero,
          animation: false,
          lineHeight: appH(14),
          percent: 0.5,
          backgroundColor: Colors.grey.shade200,
          barRadius: Radius.circular(16),
          progressColor: AppColors.secondBlue,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.close),
            style: IconButton.styleFrom(highlightColor: Colors.transparent),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: appW(20), right: appW(20)),
        child: Column(
          children: [
            Text(
              '16/20',
              style: AppTextStyles.source.semiBold(
                color: AppColors.black,
                fontSize: 15,
              ),
            ),
            SizedBox(height: appH(50)),
            Align(
              alignment: Alignment.topCenter,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 40,
                    top: -20,
                    child: _card(Colors.blue.shade100, appW(265)),
                  ),
                  Positioned(
                    left: 20,
                    top: -10,
                    child: _card(Colors.blue.shade200, appW(305)),
                  ),
                  _card(Colors.blue.shade500, appW(345)),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: appW(24), vertical: appH(22)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.greyScale.grey200,
              spreadRadius: 20,
              blurRadius: 10,
            ),
          ],
        ),
        child: BasicButtonWg(text: 'Tasdiqlash', onTap: () {}),
      ),
    );
  }

  Widget _card(Color color, double size) {
    return Container(
      width: size,
      height: appH(210),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightBlue.withOpacity(0.5),
            blurRadius: 12,
            // spreadRadius: 1,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Вопрос 1',
            style: AppTextStyles.source.medium(
              color: AppColors.white,
              fontSize: 16,
            ),
          ),
          Text(
            'В каком из приведённых предложений нарушены синтаксические нормы (правила построения предложений)?',
            style: AppTextStyles.source.regular(
              color: AppColors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
