import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/profile_event.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/support/support_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/support/support_state.dart';
import 'package:skills_xorijdaish/features/profile/presentation/screens/support/chat/tickets_chat_page.dart';
import 'package:skills_xorijdaish/features/profile/presentation/screens/support/no_tickets_page.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  @override
  void initState() {
    super.initState();
    context.read<SupportBloc>().add(SupportEvent(1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupportBloc, SupportState>(
      builder: (context, state) {
        if (state is SupportLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is SupportLoaded) {
          return Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<SupportBloc>().add(SupportEvent(1));
              },
              child: ListView.builder(
                itemCount: state.response.data.length + 1,
                itemBuilder: (context, index) {
                  if (index == state.response.data.length) {
                    final currentPage = state.response.metaData.currentPage;
                    final lastPage = state.response.metaData.lastPage;
                    final meta = state.response.metaData;
                    final bool isLastPage = currentPage == lastPage;
                    if (meta.total > meta.perPage) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (currentPage < lastPage)
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.appBg,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 12,
                                  ),
                                ),
                                onPressed: () {
                                  context.read<SupportBloc>().add(
                                    SupportEvent(currentPage + 1),
                                  );
                                },
                                child: Text(
                                  "Load More",
                                  style: AppTextStyles.source.medium(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            )
                          else
                            SizedBox.shrink(),
                          if (!isLastPage) SizedBox(height: appH(20)),
                        ],
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  }

                  final support = state.response.data[index];
                  if (state.response.data.isEmpty) {
                    return NoTicketsPage();
                  }
                  return _buildTicket(
                    title: support.title,
                    date: support.createdAt,
                    status: support.status,
                    onTap: () {
                      AppRoute.go(TicketsChatPage(ticketId: support.id));
                    },
                  );
                },
              ),
            ),
          );
        }
        return SizedBox.shrink();
      },
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
      case 'accepted':
        bgColor = const Color(0xffE0FAEC);
        textColor = const Color(0xff1FC16B);
        icon = Icons.check_circle;
        statusText = 'Tasdiqlangan';
        break;
      case 'new':
        bgColor = const Color(0xffFFF4E7);
        textColor = const Color(0xffF7931E);
        icon = Icons.warning_amber_rounded;
        statusText = 'Kutilmoqda';
        break;
      default:
        bgColor = Colors.grey.shade200;
        textColor = Colors.grey;
        icon = Icons.info;
        statusText = 'Yakunlangan';
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
