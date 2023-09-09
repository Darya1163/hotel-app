import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.pressedButton});

  final String title;
  final void Function() pressedButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: const BoxConstraints.tightFor(width: 343, height: 48),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(13, 114, 255, 1)),
          fixedSize: MaterialStateProperty.all(const Size(343, 48)),
          // minimumSize: MaterialStateProperty.all(const Size(343, 48)),
          // maximumSize: MaterialStateProperty.all(const Size(343, 48)),
        ),
        onPressed: pressedButton,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
