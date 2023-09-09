import 'package:flutter/material.dart';

import 'custom_form.dart';

class ExpansionForm extends StatefulWidget {
  const ExpansionForm(
      {super.key, required this.isExpanded, required this.title});
  final bool isExpanded;
  final String title;

  @override
  State<ExpansionForm> createState() => _ExpansionFormState();
}

class _ExpansionFormState extends State<ExpansionForm> {
  bool _customTileExpanded = false;

  TextEditingController nameInput = TextEditingController();
  TextEditingController surnameInput = TextEditingController();
  TextEditingController birthInput = TextEditingController();
  TextEditingController countryInput = TextEditingController();
  TextEditingController emailInput = TextEditingController();
  TextEditingController passNumInput = TextEditingController();
  TextEditingController passPeriodInput = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        children: [
          ExpansionTile(
            initiallyExpanded: widget.isExpanded,
            shape: Border.all(color: Colors.transparent),
            title: Text(
              widget.title,
              style: const TextStyle(
                fontFamily: 'SF Form Display',
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Icon(
              _customTileExpanded
                  ? Icons.arrow_drop_down_circle
                  : Icons.arrow_drop_down,
            ),
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
            children: [
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextField(
                  textController: nameInput,
                  hintText: 'Имя',
                  inputType: TextInputType.text,
                  mask: '',
                  prefixText: '',
                ),
              ),
              const SizedBox(height: 8),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextField(
                  textController: surnameInput,
                  hintText: 'Фамилия',
                  inputType: TextInputType.text,
                  mask: '',
                  prefixText: '',
                ),
              ),
              const SizedBox(height: 8),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextField(
                  textController: birthInput,
                  hintText: 'Дата рождения',
                  inputType: TextInputType.datetime,
                  mask: '',
                  prefixText: '',
                ),
              ),
              const SizedBox(height: 8),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextField(
                  textController: countryInput,
                  hintText: 'Гражданство',
                  inputType: TextInputType.text,
                  mask: '',
                  prefixText: '',
                ),
              ),
              const SizedBox(height: 8),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextField(
                  textController: passNumInput,
                  hintText: 'Номер загранпаспорта',
                  inputType: TextInputType.number,
                  mask: '',
                  prefixText: '',
                ),
              ),
              const SizedBox(height: 8),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextField(
                  textController: passPeriodInput,
                  hintText: 'Срок действия загранпаспорта',
                  inputType: TextInputType.text,
                  mask: '',
                  prefixText: '',
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}
