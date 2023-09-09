import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_app/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:hotels_app/presentation/widgets/common/feature_widget.dart';

class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state is HotelLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is HotelLoadedState) {
          return Container(
            margin: const EdgeInsets.only(top: 16, bottom: 12),
            width: 343,
            child: Wrap(
              children: state.hotel.aboutTheHotel.peculiarities!.map((e) {
                return FeatureWidget(title: e);
              }).toList(),
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
