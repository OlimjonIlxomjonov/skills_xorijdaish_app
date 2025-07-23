import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_xorijdaish/core/common/textstyles/app_text_styles.dart';
import 'package:skills_xorijdaish/core/common/widgets/appbar/custom_app_bar.dart';
import 'package:skills_xorijdaish/core/common/widgets/flush_bar/flush_bar_wg.dart';
import 'package:skills_xorijdaish/core/common/widgets/flush_bar/sucess_flesh_bar_wg.dart';
import 'package:skills_xorijdaish/core/common/widgets/text_field/custom_phone_textfield.dart';
import 'package:skills_xorijdaish/core/common/widgets/text_field/custom_textfield.dart';
import 'package:skills_xorijdaish/core/configs/assets/app_vectors.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/create_ticket/create_ticket_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/create_ticket/create_ticket_state.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/profile_event.dart';
import 'package:skills_xorijdaish/features/profile/presentation/bloc/support/support_bloc.dart';
import 'package:skills_xorijdaish/features/profile/presentation/screens/support/support_page.dart';

import '../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../core/common/widgets/button/basic_button_wg.dart';

class CreateTicket extends StatefulWidget {
  const CreateTicket({super.key});

  @override
  State<CreateTicket> createState() => _CreateTicketState();
}

class _CreateTicketState extends State<CreateTicket> {
  final TextEditingController mavzuController = TextEditingController();
  final TextEditingController muammoController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  File? pickedFile;

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      setState(() {
        pickedFile = File(result.files.single.path!);
      });
    } else {
      setState(() {
        pickedFile = null;
      });
    }
  }

  bool _createTicket() {
    final subject = mavzuController.text.trim();
    final issue = muammoController.text.trim();
    String phone = phoneController.text.replaceAll(' ', '').trim();

    if (subject.isEmpty || issue.isEmpty) {
      showErrorFlushbar(context, 'Iltimos barcha maydonlarni to‘ldiring');
      return false;
    }

    if (phone.isEmpty || phone.length < 9 || phone.length > 9) {
      showErrorFlushbar(context, 'Telefon raqam noto‘g‘ri kiritilgan');
      return false;
    }

    if (phone.startsWith('+998')) {
      phone = phone.substring(1);
    } else if (!phone.startsWith('998')) {
      phone = '998$phone';
    }

    context.read<CreateTicketBloc>().add(
      CreateTicketEvent(subject, issue, phone, pickedFile),
    );

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateTicketBloc, CreateTicketState>(
      listener: (context, state) {
        if (state is CreateTicketLoaded) {
          AppRoute.close();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBar(titleText: 'Yangi tikket'),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: appW(20),
            vertical: appH(20),
          ),
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mavzu'),
              CustomTextfield(
                hintText: 'Izoh qoldiring...',
                controller: mavzuController,
              ),
              SizedBox(height: appH(15)),
              Text('Muammo'),
              CustomTextfield(
                hintText: 'Izoh qoldiring...',
                controller: muammoController,
              ),
              SizedBox(height: appH(15)),
              GestureDetector(
                onTap: pickFile,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  dashPattern: [6, 4],
                  color: AppColors.textGrey,
                  strokeWidth: 1.5,
                  child: Container(
                    height: appH(56),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Color(0xffF7F7F8),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade50,
                          spreadRadius: 1,
                          blurRadius: 15,
                        ),
                      ],
                    ),
                    child: Row(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppVectors.upload),
                        SizedBox(width: 10),
                        Text(
                          pickedFile != null
                              ? pickedFile!.path.split('/').last
                              : 'Upload file (pdf, doc, excel)',
                          style: AppTextStyles.source.regular(
                            color: Color(0xff150A33),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: appH(15)),
              Text('Telefon raqam'),
              CustomPhoneTextField(controller: phoneController),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: appH(24)),
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                spreadRadius: 10,
                blurRadius: 10,
                color: Colors.grey.shade200,
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: BasicButtonWg(
            text: 'Yaratish',
            onTap: () {
              final success = _createTicket();
              if (success) {
                AppRoute.close();
                successFlushBar(context, 'Muvaffaqiyatl yaratildi!');
                context.read<SupportBloc>().add(SupportEvent());
              }
            },
          ),
        ),
      ),
    );
  }
}
