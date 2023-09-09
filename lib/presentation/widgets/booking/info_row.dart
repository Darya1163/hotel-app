import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 16),
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: 16,
              color: Color(0xff828796),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            value,
            style: const TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
