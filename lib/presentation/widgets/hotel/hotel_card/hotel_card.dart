import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/hotel_bloc/hotel_bloc.dart';
import '../../common/carousel_widget.dart';
import '../../common/price.dart';
import '../../common/rate.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state is HotelLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is HotelLoadedState) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Column(
              children: [
                CarouselWidget(imageUrls: state.hotel.imageUrls),
                const Rate(),
                Container(
                  margin: const EdgeInsets.only(bottom: 6),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        state.hotel.name,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      state.hotel.adress,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                        color: Color(0xff0D72FF),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16,
                  ),
                  child: Price(
                    value: 'от ${(state.hotel.minimalPrice.toString())} ₽',
                    period: state.hotel.priceForIt,
                  ),
                ),
              ],
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
