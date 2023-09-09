import 'package:flutter/material.dart';

import '../common/feature_widget.dart';

class ApartmentFeatures extends StatelessWidget {
  const ApartmentFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
            width: 343,
            child: Wrap(
              children: [
                FeatureWidget(title: 'Все включено'),
                SizedBox(
                  width: 8,
                ),
                FeatureWidget(title: 'Кондиционер'),          
                SizedBox(
                  width: 8,
                ),
              ],
            ),
          );
  }
}