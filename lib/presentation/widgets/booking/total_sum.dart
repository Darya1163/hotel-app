import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_app/bloc/room_reservation_bloc/room_reservation_bloc.dart';

import 'booking_info.dart';

class TotalSum extends StatelessWidget {
  const TotalSum({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomReservationBloc, RoomReservationState>(
      builder: (context, state) {
        if (state is RoomReservationLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is RoomReservationLoadedState) {
          return Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              BookingInfo(title: 'Тур', value: '${state.room.tourPrice} ₽'),
              const SizedBox(height: 16),
              BookingInfo(title: 'Топливный сбор', value: '${state.room.fuelCharge} ₽'),
              const SizedBox(height: 16),
              BookingInfo(title: 'Сервисный сбор', value: '${state.room.serviceCharge} ₽'),
              const SizedBox(height: 16),
              BookingInfoTotal(title: 'К оплате', value: '${state.room.tourPrice /* * touristsNum*/ + state.room.serviceCharge + state.room.fuelCharge} ₽'),
            ],
          ),
        );
        }

        if (state is RoomReservationErrorState) {
          return Center(
            child: Text(state.message.toString()),
          );
        }

        return Container();
      },
    );
  }
}
