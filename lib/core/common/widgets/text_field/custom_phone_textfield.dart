import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomPhoneTextField extends StatefulWidget {
  const CustomPhoneTextField({super.key});

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
    return IntlPhoneField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Raqamni kirting',
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
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
      style: TextStyle(fontSize: 16),
    );
  }
}
