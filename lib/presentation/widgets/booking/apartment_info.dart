import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_app/bloc/room_reservation_bloc/room_reservation_bloc.dart';
import 'package:hotels_app/domain/room_reservation.dart';

import '../common/rate.dart';

class ApartmentInfo extends StatelessWidget {
  const ApartmentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomReservationBloc, RoomReservationState>(
      builder: (context, state) {
        if (state is RoomReservationLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is RoomReservationLoadedState) {
          return Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            children: [
              // const Rate(),
              Container(
                margin: const EdgeInsets.only(bottom: 6),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      state.room.hotelName,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      state.room.hotelAdress,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                        color: Color(0xff0D72FF),
                      ),
                    ),
                  ),
                ),
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
