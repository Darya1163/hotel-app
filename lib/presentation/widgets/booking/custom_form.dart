import 'package:flutter/material.dart';
import 'package:masked_text_field/masked_text_field.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.inputType,
      required this.mask,
      required this.prefixText,
      required this.textController});
  final TextInputType inputType;

  final String hintText;
  final String mask;
  final String prefixText;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return MaskedTextField(
      inputDecoration: InputDecoration(
        counterText: "",
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
      mask: mask,
      textFieldController: textController,
      onChange: (String value) {},
    );
  }
}
