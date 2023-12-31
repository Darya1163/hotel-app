import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_app/bloc/form_bloc/form_bloc.dart';
import 'package:hotels_app/bloc/room_reservation_bloc/room_reservation_bloc.dart';
import 'package:hotels_app/main.dart';

import 'apartment_screen.dart';
import 'payed_screen.dart';
import 'widgets/booking/add_tourist.dart';
import 'widgets/booking/apartment_details.dart';
import 'widgets/booking/apartment_info.dart';
import 'widgets/booking/customer_info.dart';
import 'widgets/booking/expansion_form.dart';
import 'widgets/booking/total_sum.dart';
import 'widgets/common/custom_appbar.dart';
import 'widgets/common/custom_button.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 50),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<RoomReservationBloc>()
              ..add(
                RoomReservationLoadEvent(),
              ),
          ),
          BlocProvider(
            create: (context) => TouristFormBloc()
              ..add(AddTouristBloc(
                touristForm: Column(
                  children: [
                    SizedBox(height: 8),
                    ExpansionForm(
                      isExpanded: true,
                      title: 'Первый турист ',
                    ),
                    SizedBox(height: 8),
                    ExpansionForm(
                      isExpanded: false,
                      title: 'Второй турист ',
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              )),
          ),
        ],
        child: Scaffold(
          appBar: buildMainAppBar(
            'Бронирование',
            IconButton(
              icon: const Icon(
                Icons.chevron_left,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ApartmentScreen(),
                  ),
                );
              },
            ),
          ),
          body: Container(
            color: Color(0xffF6F6F9),
            child: SingleChildScrollView(
              child: BlocBuilder<TouristFormBloc, TouristFormState>(
                builder: (context, state) {
                  void addFunc() {
                    context.read<TouristFormBloc>().add(AddTouristBloc(
                            touristForm: Column(
                          children: [
                            ExpansionForm(
                                isExpanded: true, title: 'Следующий турист'),
                            SizedBox(height: 8),
                          ],
                        )));
                  }

                  List<Widget> touristsList = state.tourists;
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        const ApartmentInfo(),
                        const SizedBox(height: 8),
                        const ApartmentDetails(),
                        const SizedBox(height: 8),
                        CustomerInfo(),
                        Column(
                          children: touristsList,
                        ),
                        AddTourist(
                          addFunc: addFunc,
                        ),
                        const SizedBox(height: 8),
                        const TotalSum(),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 12, bottom: 28, left: 16, right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: CustomButton(
                            title: 'Оплатить 198 036 ₽',
                            pressedButton: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const PayedScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
