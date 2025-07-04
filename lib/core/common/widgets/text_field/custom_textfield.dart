import 'package:flutter/material.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import '../../constants/colors/app_colors.dart';

class CustomTextfield extends StatefulWidget {
  final String hintText;
  final bool isPassword;

  const CustomTextfield({
    super.key,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  final FocusNode _focusNode = FocusNode();
  bool isTextFieldFocused = false;
  bool isObscured = true;

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
      height: appH(55),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: isTextFieldFocused ? AppColors.blue : AppColors.inputGreyColor,
          width: isTextFieldFocused ? 2 : 1.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        focusNode: _focusNode,
        obscureText: widget.isPassword ? isObscured : false,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: AppColors.textGrey),
          suffixIcon:
              widget.isPassword
                  ? IconButton(
                    icon: Icon(
                      isObscured ? Icons.visibility_off : Icons.visibility,
                      color:
                          isTextFieldFocused ? AppColors.blue : AppColors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                  )
                  : null,
        ),
      ),
    );
  }
}
