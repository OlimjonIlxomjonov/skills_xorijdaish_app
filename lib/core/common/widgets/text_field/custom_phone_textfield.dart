import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../constants/colors/app_colors.dart';

class CustomPhoneTextField extends StatefulWidget {
  final TextEditingController controller;

  const CustomPhoneTextField({super.key, required this.controller});

  @override
  State<CustomPhoneTextField> createState() => _CustomPhoneTextFieldState();
}

class _CustomPhoneTextFieldState extends State<CustomPhoneTextField> {
  final FocusNode _focusNode = FocusNode();
  bool isTextFieldFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isTextFieldFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.inputGreyColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IntlPhoneField(
        controller: widget.controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: '000-00-00',
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          border: InputBorder.none,
        ),
        initialCountryCode: 'UZ',
        disableLengthCheck: true,
        showDropdownIcon: true,
        dropdownIcon: Icon(
          Icons.arrow_drop_down,
          color: Colors.transparent,
          size: 10,
        ),
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
