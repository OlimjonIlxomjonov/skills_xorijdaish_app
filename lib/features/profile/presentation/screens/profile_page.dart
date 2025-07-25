import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/common/widgets/button/basic_button_wg.dart';
import 'package:skills_xorijdaish/core/common/widgets/flush_bar/flush_bar_wg.dart';
import 'package:skills_xorijdaish/core/common/widgets/flush_bar/sucess_flesh_bar_wg.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_images.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/features/auth/presentation/screens/auth_page.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/profile_event.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/revoke_session/revoke_session_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/self_info/self_info_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/self_info/self_info_state.dart';
import 'package:skills_xorijdaish/features/profile/presentation/screens/active_sessions/active_session_page.dart';
import 'package:skills_xorijdaish/features/profile/presentation/screens/certificates/certificates_page.dart';
import 'package:skills_xorijdaish/features/profile/presentation/screens/notifications/notifications_page.dart';
import 'package:skills_xorijdaish/features/profile/presentation/screens/self_information/self_information_page.dart';
import 'package:skills_xorijdaish/features/profile/presentation/screens/self_information/user_info_storage.dart';
import 'package:skills_xorijdaish/features/profile/presentation/screens/support/support_page.dart';

import '../../../../core/utils/logger/logger.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';
import '../bloc/sessions/session_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        final file = File(pickedFile.path);
        setState(() {
          image = file;
        });
        userInfo.avatarImage = file;
      }
    } catch (e) {
      logger.e('Error occurred while getting an image, $e');
    }
  }

  void showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder:
          (context) => Wrap(
            children: [
              ListTile(
                leading: Icon(IconlyLight.camera),
                title: Text('Take a Photo'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(titleText: AppStrings.myProfile, onTap: () {}),
      body: Padding(
        padding: EdgeInsets.only(
          left: appW(20),
          right: appW(20),
          top: appH(10),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: appH(70),
                  backgroundColor: AppColors.greyScale.grey300,
                  backgroundImage:
                      image != null
                          ? FileImage(image!)
                          : AssetImage(AppImages.defaultProfilePic),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: showImagePickerOptions,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: AppColors.textGrey,
                        size: appH(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: appH(12)),
            Column(
              children: [
                userInfo.isVerified == true
                    ? Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userInfo.fullName ?? 'Label',
                          style: AppTextStyles.source.semiBold(
                            color: AppColors.black,
                            fontSize: 20,
                          ),
                        ),
                        Icon(
                          Icons.verified_rounded,
                          color: AppColors.secondBlue,
                        ),
                      ],
                    )
                    : Text(
                      userInfo.fullName ?? 'Label',
                      style: AppTextStyles.source.semiBold(
                        color: AppColors.black,
                        fontSize: 20,
                      ),
                    ),
                SizedBox(height: appH(8)),
                userInfo.isVerified == true
                    ? Text(userInfo.phoneNumber ?? '')
                    : Center(
                      child: Container(
                        width: appW(200),
                        padding: EdgeInsets.symmetric(
                          vertical: appH(3),
                          horizontal: appW(5),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffFC7B06),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Shaxsingizni tasdiqlang',
                              style: AppTextStyles.source.medium(
                                color: AppColors.white,
                                fontSize: 14,
                              ),
                            ),
                            Icon(
                              IconlyLight.arrow_right_2,
                              color: AppColors.white,
                              size: appW(15),
                            ),
                          ],
                        ),
                      ),
                    ),
              ],
            ),
            SizedBox(height: appH(10)),
            Divider(color: AppColors.greyScale.grey200),
            SizedBox(height: appH(10)),
            Column(
              spacing: appH(20),
              children: [
                buildRow(
                  IconlyLight.profile,
                  () {
                    AppRoute.go(SelfInformationPage());
                  },
                  AppStrings.shxsiyMalumotlar,
                  optionalIcon: IconlyLight.arrow_right_2,
                ),
                buildRow(
                  IconlyLight.notification,
                  () {
                    AppRoute.go(NotificationsPage());
                  },
                  AppStrings.bildirishNomalar,
                  optionalIcon: IconlyLight.arrow_right_2,
                ),
                buildRow(
                  IconlyLight.paper,
                  () {
                    AppRoute.go(CertificatesPage());
                  },
                  AppStrings.sertifikatLar,
                  optionalIcon: IconlyLight.arrow_right_2,
                ),
                buildRow(
                  IconlyLight.more_square,
                  () {
                    AppRoute.go(ActiveSessionPage());
                  },
                  AppStrings.faolSeanslar,
                  optionalIcon: IconlyLight.arrow_right_2,
                ),
                buildRow(
                  IconlyLight.chat,
                  () {
                    AppRoute.go(SupportPage());
                  },
                  AppStrings.qollabQuvatlash,
                  optionalIcon: IconlyLight.arrow_right_2,
                ),
                buildRow(
                  IconlyLight.info_square,
                  () {},
                  AppStrings.faq,
                  optionalIcon: IconlyLight.arrow_right_2,
                ),
                buildRow(
                  IconlyLight.logout,
                  () {
                    buildShowModalBottomSheet(context);
                  },
                  AppStrings.akkauntdanChiqish,
                  appColor: AppColors.red,
                  iconColor: AppColors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          height: appH(290),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 8, bottom: 24),
                width: 38,
                height: appH(3),
                decoration: BoxDecoration(
                  color: Color(0xffE0E0E0),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              Text(
                'Akkauntdan chiqish',
                style: AppTextStyles.source.medium(
                  color: AppColors.red,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 24),
              Divider(color: AppColors.greyScale.grey300),
              SizedBox(height: 24),
              Text(
                'Siz rostdan ham akkauntdan chiqmoqchimisiz?',
                style: AppTextStyles.source.regular(
                  color: AppColors.black,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          AppRoute.close();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, appH(51)),
                          backgroundColor: AppColors.white,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: Color(0xff5B7BFE),
                              width: 2,
                            ),
                          ),
                        ),
                        child: Text(
                          'Bekor qilish',
                          style: AppTextStyles.source.medium(
                            color: Color(0xff5B7BFE),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: BasicButtonWg(
                        text: 'Tasdiqlash',
                        onTap: () {
                          if (userInfo.sessionId != null) {
                            context.read<RevokeSessionBloc>().add(
                              RevokeSessionEvent(userInfo.sessionId ?? ''),
                            );
                            logger.f(userInfo.sessionId ?? '');
                            AppRoute.open(AuthPage());
                            successFlushBar(context, 'Muvaffaqiyat!');
                          } else {
                            showErrorFlushbar(context, 'Xato!');
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildRow(
    IconData icon,
    VoidCallback onTap,
    String text, {
    IconData? optionalIcon,
    Color appColor = AppColors.black,
    Color iconColor = AppColors.black,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Icon(icon, size: appH(28), color: iconColor),
            SizedBox(width: appW(16)),
            Expanded(
              child: Text(
                text,
                style: AppTextStyles.source.medium(
                  color: appColor,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: appW(8)),
              child: Icon(optionalIcon, size: appH(20)),
            ),
          ],
        ),
      ),
    );
  }
}
