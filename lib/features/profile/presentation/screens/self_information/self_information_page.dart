import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/profile_event.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/self_info/self_info_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/self_info/self_info_state.dart';
import 'package:skills_xorijdaish/features/profile/presentation/screens/self_information/user_info_storage.dart';

class SelfInformationPage extends StatelessWidget {
  const SelfInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SelfInfoBloc>().add(SelfInfoEvent());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(titleText: "Shaxsiy ma'lumotlar", onTap: () {}),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: BlocBuilder<SelfInfoBloc, SelfInfoState>(
          builder: (context, state) {
            if (state is SelfInfoLoading) {
              return Expanded(
                child: ListView.builder(
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
            } else if (state is SelfInfoError) {
              return Text(state.message);
            } else if (state is SelfInfoLoaded) {
              final info = state.entity;
              userInfo.fullName = info.name ?? '';
              userInfo.phoneNumber = info.phoneNumber ?? '';

              return Column(
                spacing: 15,
                children: [
                  infoFields('Foydalanuvchi FIO', displayOrDash(info.name)),
                  infoFields('PNFL raqami', displayOrDash(info.pinfl)),
                  infoFields(
                    'Pasport seriya va raqami',
                    displayOrDash(info.passportData),
                  ),
                  infoFields("Tug’ilgan sanasi", displayOrDash(info.birthDate)),
                ],
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }

  String displayOrDash(String? value) {
    if (value == null || value.trim().isEmpty) return '----';
    return value;
  }

  Column infoFields(String text, hintText) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppTextStyles.source.medium(
            color: AppColors.textGrey,
            fontSize: 14,
          ),
        ),
        Container(
          width: double.infinity,
          height: appH(56),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.greyScale.grey50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              hintText,
              style: AppTextStyles.source.medium(
                color: AppColors.black,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
