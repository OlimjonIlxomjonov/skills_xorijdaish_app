import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  final List<Map<String, dynamic>> tickets = const [
    {
      'title': 'Pullik kurslar bo’yicha savollarim',
      'date': '12.02.2025',
      'status': 'approved',
    },
    {
      'title': 'Rossiyaga ketish oldidan',
      'date': '12.02.2025',
      'status': 'pending',
    },
    {
      'title': 'Ingliz tili kurslari uchun',
      'date': '12.02.2025',
      'status': 'rejected',
    },
    {
      'title': 'Pullik kurslar bo’yicha savollarim',
      'date': '12.02.2025',
      'status': 'approved',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          tickets.map((ticket) {
            return _buildTicket(
              title: ticket['title'],
              date: ticket['date'],
              status: ticket['status'],
              onTap: () {},
            );
          }).toList(),
    );
  }

  Widget _buildTicket({
    required String title,
    required String date,
    required String status,
    required VoidCallback onTap,
  }) {
    Color bgColor;
    Color textColor;
    IconData icon;
    String statusText;

    switch (status) {
      case 'approved':
        bgColor = const Color(0xffE0FAEC);
        textColor = const Color(0xff1FC16B);
        icon = Icons.check_circle;
        statusText = 'Tasdiqlangan';
        break;
      case 'pending':
        bgColor = const Color(0xffFFF4E7);
        textColor = const Color(0xffF7931E);
        icon = Icons.warning_amber_rounded;
        statusText = 'Kutilmoqda';
        break;
      case 'rejected':
        bgColor = const Color(0xffFFE5E5);
        textColor = const Color(0xffF15E5E);
        icon = Icons.error;
        statusText = 'Bekor qilingan';
        break;
      default:
        bgColor = Colors.grey.shade200;
        textColor = Colors.grey;
        icon = Icons.info;
        statusText = 'Nomaʼlum';
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: appH(16)),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.greyScale.grey200),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left section (Title + Date)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: appW(150),
                  child: Text(
                    title,
                    style: AppTextStyles.source.semiBold(
                      color: AppColors.black,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: appH(4)),
                Text(
                  date,
                  style: AppTextStyles.source.medium(
                    color: const Color(0xff7E92A2),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            // Right section (Status + Arrow)
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: appW(6),
                    vertical: appH(2),
                  ),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Icon(icon, color: textColor, size: appH(16)),
                      SizedBox(width: appW(4)),
                      Text(
                        statusText,
                        style: AppTextStyles.source.medium(
                          color: textColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: appW(8)),
                const Icon(IconlyLight.arrow_right_2, color: Color(0xff7E92A2)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
