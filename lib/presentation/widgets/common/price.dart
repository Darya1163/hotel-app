import 'package:flutter/material.dart';

class Price extends StatelessWidget {
  const Price({super.key, required this.value, required this.period});

  final String value;
  final String period;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 30,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            period,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'SF Pro Display',
              color: Color(0xff828796),
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
