import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/common/widgets/flush_bar/sucess_flesh_bar_wg.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/session/session_entity.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/profile_event.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/revoke_session/revoke_session_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/sessions/session_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/sessions/session_state.dart';
import 'package:skills_xorijdaish/features/profile/presentation/screens/self_information/user_info_storage.dart';

import '../../../../../core/page_route/route_generator.dart';

class ActiveSessionPage extends StatefulWidget {
  const ActiveSessionPage({super.key});

  @override
  State<ActiveSessionPage> createState() => _ActiveSessionPageState();
}

class _ActiveSessionPageState extends State<ActiveSessionPage> {
  @override
  void initState() {
    super.initState();
    context.read<SessionBloc>().add(SessionEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(titleText: 'Faol seanslar'),
      body: BlocBuilder<SessionBloc, SessionState>(
        builder: (context, state) {
          if (state is SessionLoading) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: 20,
                    left: appW(20),
                    right: appW(20),
                  ),
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
            );
          } else if (state is SessionError) {
            return Text('Error Occurred!');
          } else if (state is SessionLoaded) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: appW(20)),
              child: ListView.builder(
                itemCount: state.response.data.length,
                itemBuilder: (context, index) {
                  final session = state.response.data[index];
                  if (session.isMe) {
                    userInfo.sessionId = session.id;
                    logger.w(userInfo.sessionId);
                  }
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: appH(5)),
                    margin: EdgeInsets.only(bottom: appH(20)),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff0A0D1408)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      onTap: () {
                        !session.isMe
                            ? buildShowBottomSheet(context, session)
                            : SizedBox.shrink();
                      },
                      contentPadding: EdgeInsets.only(left: 10, right: 10),
                      leading: CircleAvatar(
                        backgroundColor: Color(0xffF2F5F8),
                        radius: appH(25),
                        child: Icon(Icons.smartphone),
                      ),
                      title: RichText(
                        text: TextSpan(
                          text: session.name,
                          children: [
                            TextSpan(
                              text: " (${session.updatedAtHuman})",
                              style: AppTextStyles.source.medium(
                                color: Color(0xff525866),
                                fontSize: 14,
                              ),
                            ),
                          ],
                          style: AppTextStyles.source.medium(
                            color: Color(0xff0E121B),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        session.location ?? 'Label',
                        style: AppTextStyles.source.medium(
                          color: Color(0xff525866),
                          fontSize: 14,
                        ),
                      ),
                      trailing:
                          !session.isMe
                              ? Icon(Icons.close, size: appH(15))
                              : SizedBox.shrink(),
                    ),
                  );
                },
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  PersistentBottomSheetController buildShowBottomSheet(
    BuildContext context,
    SessionEntity session,
  ) {
    return showBottomSheet(
      context: context,
      builder:
          (context) => Container(
            padding: EdgeInsets.only(top: 10),
            height: appH(280),
            decoration: BoxDecoration(color: AppColors.white),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 180),
                  child: Divider(height: 5, thickness: 3),
                ),
                SizedBox(height: appH(10)),
                Text(
                  "Seansni chiqarish",
                  style: AppTextStyles.source.medium(
                    color: Colors.red,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: appH(10)),
                Divider(),
                SizedBox(height: appH(10)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: appH(20)),
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        'Siz rostdan ham seansni chiqarmiqchisizmi? \n ${session.name}',
                        style: AppTextStyles.source.regular(
                          color: AppColors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: appH(50)),
                      Row(
                        spacing: 15,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                AppRoute.close();
                              },
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                    width: 1,
                                    color: AppColors.appBg,
                                  ),
                                ),
                                backgroundColor: AppColors.white,
                                minimumSize: Size(double.infinity, appH(50)),
                              ),
                              child: Text(
                                'Bekor qilish',
                                style: AppTextStyles.source.medium(
                                  color: AppColors.appBg,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<RevokeSessionBloc>().add(
                                  RevokeSessionEvent(session.id),
                                );
                                context.read<SessionBloc>().add(SessionEvent());
                                AppRoute.close();
                                successFlushBar(
                                  context,
                                  "Muvaffaqiyatli o'chirildi!",
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: AppColors.appBg,
                                minimumSize: Size(double.infinity, appH(50)),
                              ),
                              child: Text(
                                'Tasdiqlash',
                                style: AppTextStyles.source.medium(
                                  color: AppColors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
