import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_images.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_vectors.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/one_id_web_view.dart';

import '../../../../core/utils/logger/logger.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              color: AppColors.appBg,
              child: SvgPicture.asset(AppVectors.logo, fit: BoxFit.none),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 21, top: 40),
              child: Column(
                children: [
                  Row(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        child: customCheckBox(),
                      ),
                      SizedBox(
                        width: appW(320),
                        child: RichText(
                          text: TextSpan(
                            style: AppTextStyles.source.regular(
                              color: AppColors.textGrey,
                              fontSize: 16,
                            ),
                            text: AppStrings.royhatdanOtishOrqali,
                            children: [
                              TextSpan(
                                text: AppStrings.mahfiylikSiyosatimiz,
                                style: AppTextStyles.source.regular(
                                  color: AppColors.lightBlue,
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text: AppStrings.bilanBogliqShartnomamizga,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: appH(28)),
                  Padding(
                    padding: EdgeInsets.only(right: 21),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, appH(51)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: AppColors.appBg,
                      ),
                      onPressed:
                          isChecked
                              ? () async {
                                final token = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => OneIDLoginPage2(),
                                  ),
                                );
                                if (token != null) {
                                  logger.i('Access token: $token');
                                }
                                if (!isChecked) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Maxfiylik siyosatimizni qabul qiling',
                                      ),
                                    ),
                                  );
                                }
                              }
                              : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 12,
                        children: [
                          SvgPicture.asset(AppVectors.oneId),
                          Text(
                            'Orqali kirish',
                            style: AppTextStyles.source.medium(
                              color: AppColors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  // SvgPicture.asset(AppVectors.poweredBy),
                  Row(
                    spacing: 12,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Powered by',
                        style: AppTextStyles.source.medium(
                          color: AppColors.black,
                          fontSize: 12,
                        ),
                      ),
                      Image.asset(
                        AppImages.poweredByRight,
                        width: appW(96),
                        height: appH(25),
                      ),
                    ],
                  ),
                  SizedBox(height: appH(30)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container customCheckBox() {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: isChecked ? AppColors.appBg : Colors.transparent,
        border: Border.all(color: AppColors.appBg, width: 2),
        borderRadius: BorderRadius.circular(4),
      ),
      child:
          isChecked
              ? Center(
                child: Icon(Icons.check, size: appH(14), color: Colors.white),
              )
              : null,
    );
  }
}
