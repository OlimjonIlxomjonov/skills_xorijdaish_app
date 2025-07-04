import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  Map<String, bool> toggleStates = {
    'Umumiy bildirishnomalar': false,
    'Ovoz': false,
    'Ilovani avtomat yangilash': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(titleText: 'Bildirishnomalar'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        child: Column(
          spacing: appH(28),
          children: [
            options('Umumiy bildirishnomalar'),
            options('Ovoz'),
            options('Ilovani avtomat yangilash'),
          ],
        ),
      ),
    );
  }

  Row options(String text) {
    final isActive = toggleStates[text] ?? false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppTextStyles.source.medium(
            color: AppColors.black,
            fontSize: 18,
          ),
        ),
        FlutterSwitch(
          value: isActive,
          width: appW(44),
          height: appH(24),
          activeColor: AppColors.secondBlue,
          toggleColor: AppColors.white,
          inactiveColor: Color(0xffDAE1E9),
          toggleSize: 20,
          showOnOff: false,
          padding: 3,
          onToggle: (value) {
            setState(() {
              toggleStates[text] = value;
            });
          },
        ),
      ],
    );
  }
}
