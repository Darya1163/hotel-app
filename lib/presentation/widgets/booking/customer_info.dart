import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import 'custom_form.dart';

class CustomerInfo extends StatelessWidget {
  CustomerInfo({super.key});

  TextEditingController phoneInput = TextEditingController();
  TextEditingController emailInput = TextEditingController();

  void validate(TextEditingController text) {
    if (text.text == null || text.text.isEmpty) {
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 232,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Информация о покупателе',
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Form(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CustomTextField(
                    textController: phoneInput,
                    hintText: 'Номер телефона',
                    inputType: TextInputType.phone,
                    prefixText: '',
                    validate: (value) {},
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    textController: emailInput,
                    hintText: 'Почта',
                    inputType: TextInputType.emailAddress,
                    prefixText: '',
                    validate: (value) {},
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            const Text(
              'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: 14,
                color: Color(0xff828796),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
