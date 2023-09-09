import 'package:flutter/material.dart';

import 'booking_screen.dart';
import 'widgets/common/custom_appbar.dart';
import 'widgets/common/custom_button.dart';

class PayedScreen extends StatelessWidget {
  const PayedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 50),
      child: Scaffold(
        appBar: buildMainAppBar(
          'Заказ оплачен',
          IconButton(
            icon: const Icon(Icons.chevron_left, size: 30,),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BookingScreen(),
                ),
              );
            },
          ),
        ),
        body: Column(
          children: [
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    minRadius: 47,
                    maxRadius: 47,
                    backgroundImage: AssetImage('assets/images/payed.png'),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Ваш заказ принят в работу',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 329,
                    child: Text(
                      'Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 16,
                        color: Color(0xff828796),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 28),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xffE8E9EC),
                    width: 1,
                  ),
                ),
              ),
              child: CustomButton(
                title: 'Супер!',
                pressedButton: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
