import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_app/bloc/hotel_bloc.dart';

class Rate extends StatelessWidget {
  const Rate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state is HotelLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is HotelLoadedState) {
          return Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Container(
              margin: const EdgeInsets.only(top: 16, bottom: 8),
              width: 149,
              height: 29,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 199, 0, 0.2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.star,
                    size: 15,
                    color: Color(0xffFFA800),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    state.hotel.rating.toString(),
                    style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16,
                      color: Color(0xffFFA800),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    state.hotel.ratingName,
                    style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16,
                      color: Color(0xffFFA800),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
        }

        if (state is HotelErrorState) {
          return Center(
            child: Text(state.message.toString()),
          );
        }

        return Container();
      },
    );
  }
}
