import 'package:flutter/material.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:skills_xorijdaish/core/common/constants/strings/app_strings.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/button/basic_button_wg.dart';
import 'package:skills_xorijdaish/core/common/widgets/text_field/custom_textfield.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/auth/presentation/screens/auth_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.royhatdaOtish,
              style: AppTextStyles.source.bold(
                color: AppColors.black,
                fontSize: 32,
              ),
            ),
            Text(
              AppStrings.lorem,
              style: AppTextStyles.source.regular(
                color: AppColors.greyScale.grey500,
                fontSize: 16,
              ),
            ),
            SizedBox(height: appH(40)),
            Text(
              AppStrings.teleforRaqami,
              style: AppTextStyles.source.regular(
                color: AppColors.black,
                fontSize: 14,
              ),
            ),
            CustomTextfield(hintText: '+998 123 45 67'),
            SizedBox(height: appH(40)),
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
                        TextSpan(text: AppStrings.bilanBogliqShartnomamizga),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: BasicButtonWg(
          text: AppStrings.contunie,
          onTap: () {
            AppRoute.go(AuthPage());
          },
        ),
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
