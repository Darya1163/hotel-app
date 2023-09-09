import 'package:flutter/material.dart';

class BookingInfo extends StatelessWidget {
  const BookingInfo({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: 16,
              color: Color(0xff828796),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class BookingInfoTotal extends StatelessWidget {
  const BookingInfoTotal({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: 16,
              color: Color(0xff828796),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: 16,
              color: Color(0xff0D72FF),
            ),
          ),
        ],
      ),
    );
  }
}
