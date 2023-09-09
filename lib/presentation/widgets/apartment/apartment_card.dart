import 'package:flutter/material.dart';
import '../../booking_screen.dart';
import '../common/carousel_widget.dart';
import '../common/custom_button.dart';
import '../common/price.dart';
import 'apartment_features.dart';


class ApartmentCard extends StatelessWidget {
  const ApartmentCard({super.key, required this.value, required this.period});

  final String value;
  final String period;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          CarouselWidget(),
          Container(
            margin: const EdgeInsets.only(bottom: 6, top: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Стандартный с видом на бассейн или сад',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
          ),
          const ApartmentFeatures(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 16, bottom: 8),
              height: 29,
              width: 192,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromRGBO(13, 114, 255, 0.1),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Подробнее о номере',
                    style: TextStyle(
                      color: Color(0xff0D72FF),
                      fontSize: 16,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: Color(0xff0D72FF), size: 16,),
                ],
              ),
            ),
          ),
          Price(
            value: value,
            period: period,
          ),
          const SizedBox(height: 8),
          CustomButton(title: 'Выбрать номер', pressedButton: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookingScreen()));
          }, ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}