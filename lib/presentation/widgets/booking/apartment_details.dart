import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_app/bloc/room_reservation_bloc.dart';

import 'info_row.dart';

class ApartmentDetails extends StatelessWidget {
  const ApartmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomReservationBloc, RoomReservationState>(
      builder: (context, state) {
        if (state is RoomReservationLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is RoomReservationLoadedState) {
          return Container(
          height: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            children: [
              const SizedBox(height: 16),
              InfoRow(
                title: 'Вылет из',
                value: state.room.departure,
              ),
              const SizedBox(height: 8),
              InfoRow(
                title: 'Страна, город',
                value: state.room.arrivalCountry,
              ),
              const SizedBox(height: 8),
              InfoRow(
                title: 'Даты',
                value: state.room.tourDateStart + state.room.tourDateStop,
              ),
              const SizedBox(height: 8),
              InfoRow(
                title: 'Кол-во ночей',
                value: '${state.room.numberOfNights} ночей',
              ),
              const SizedBox(height: 8),
              InfoRow(
                title: 'Отель',
                value: state.room.hotelName,
              ),
              const SizedBox(height: 8),
              InfoRow(
                title: 'Номер',
                value: state.room.room,
              ),
              const SizedBox(height: 8),
              InfoRow(
                title: 'Питание',
                value: state.room.nutrition,
              ),
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
