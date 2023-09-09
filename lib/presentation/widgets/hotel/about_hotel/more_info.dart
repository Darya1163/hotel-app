import 'package:flutter/material.dart';

import 'info_feature.dart';

class MoreInfoWidget extends StatelessWidget {
  const MoreInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: const EdgeInsets.only(top: 16),
            // height: 184,
            width: 363,
            decoration: BoxDecoration(
              color: const Color(0xffFBFBFC),
              borderRadius: BorderRadius.circular(15),
            ),
            // ignore: prefer_const_constructors
            child: Column(
              children: const [
                InfoFeature(
                  title: 'Удобства',
                  subtitle: 'Самое необходимое',
                  path: 'assets/images/emoji-happy.png',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 51, right: 15),
                  child: Divider(
                    color: Color.fromARGB(21, 135, 150, 38),
                  ),
                ),
                InfoFeature(
                  title: 'Что включено',
                  subtitle: 'Самое необходимое',
                  path: 'assets/images/tick-square.png',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 51, right: 15),
                  child: Divider(
                    color: Color.fromARGB(21, 135, 150, 38),
                  ),
                ),
                InfoFeature(
                  title: 'Что не включено',
                  subtitle: 'Самое необходимое',
                  path: 'assets/images/close-square.png',
                ),
              ],
            ),
          );
  }
}