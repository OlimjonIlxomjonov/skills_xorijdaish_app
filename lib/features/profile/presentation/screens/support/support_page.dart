import 'package:flutter/material.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/profile/presentation/screens/self_information/user_info_storage.dart';
import 'package:skills_xorijdaish/features/profile/presentation/screens/support/create_ticket.dart';
import 'package:skills_xorijdaish/features/profile/presentation/screens/support/tickets_page.dart';
import '../../../../../core/common/widgets/button/basic_button_wg.dart';
import 'no_tickets_page.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        titleText: "Qo'llab quvvatlash",
        onTap: () {
          AppRoute.close();
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mening tikketlarim',
              style: AppTextStyles.source.medium(
                color: AppColors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(height: appH(20)),
            userInfo.response == true ? NoTicketsPage() : TicketsPage(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: appH(15)),
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
        child: SafeArea(
          child: BasicButtonWg(
            text: '+ Yangi tikket yaratish',
            onTap: () {
              AppRoute.go(CreateTicket());
            },
          ),
        ),
      ),
    );
  }
}
