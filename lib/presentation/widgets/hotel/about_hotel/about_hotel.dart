import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_app/bloc/hotel_bloc.dart';

import 'features.dart';
import 'more_info.dart';

class AboutHotel extends StatelessWidget {
  const AboutHotel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Об отеле',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
          ),
          const Features(),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: BlocBuilder<HotelBloc, HotelState>(
              builder: (context, state) {
                if (state is HotelLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is HotelLoadedState) {
                  return Text(
                    state.hotel.aboutTheHotel.description!,
                    style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16,
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
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: MoreInfoWidget(),
          ),
        ],
      ),
    );
  }
}
