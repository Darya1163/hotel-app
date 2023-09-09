import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.hintText,
      required this.inputType,
      required this.prefixText,
      required this.textController,
      required this.validate});

  final TextInputType inputType;

  final String hintText;
  final String prefixText;
  final String? Function(String?) validate;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixText: prefixText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        fillColor: const Color(0xffF6F6F9),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: 'SF Pro Display',
          fontSize: 17,
          color: Color(0xffA9ABB7),
          fontWeight: FontWeight.w400,
        ),
      ),
      keyboardType: inputType,
      validator: validate,
      controller: textController,
    );
  }
}
