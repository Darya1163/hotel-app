import 'package:flutter/material.dart';
import 'apartment_screen.dart';
import 'widgets/common/custom_appbar.dart';
import 'widgets/common/custom_button.dart';
import 'widgets/hotel/about_hotel/about_hotel.dart';
import 'widgets/hotel/hotel_card/hotel_card.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 50),
      child: Scaffold(
        appBar: buildMainAppBar('Отель', const Center()),
        body: Container(
          color: const Color(0xffF6F6F9),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HotelCard(),
                const AboutHotel(),
                const SizedBox(height: 12),
                Container(
                  height: 88, 
                  color: Colors.white,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 28, top: 12, left: 16, right: 16),
                    height: 48,
                    width: double.infinity,
                    child: CustomButton(
                      title: 'К выбору номера',
                      pressedButton: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ApartmentScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
