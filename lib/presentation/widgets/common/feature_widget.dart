import 'package:flutter/material.dart';

class FeatureWidget extends StatelessWidget {
  const FeatureWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 29,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xffFBFBFC),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'SF Pro Display',
          color: Color(0xff828796),
        ),
      ),
    );
  }
}
