import 'package:flutter/material.dart';

class AddTourist extends StatelessWidget {
  const AddTourist({super.key, required this.addFunc});

  final void Function() addFunc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Добавить туриста',
              style: TextStyle(
                fontFamily: 'SF Form Display',
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            height: 32,
            width: 32,
            decoration: BoxDecoration( 
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xff0D72FF),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              color: Colors.white,
              icon: const Icon(Icons.add, size: 24),
              onPressed: addFunc,
            ),
          ),
        ],
      ),
    );
  }
}
