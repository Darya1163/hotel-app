import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_app/bloc/hotel_bloc.dart';

class CarouselWidget extends StatelessWidget {
  CarouselWidget({super.key});

  final List images = [
    Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 137, 137, 137),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 103, 34, 34),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 137, 137, 137),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 179, 132, 132),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 137, 137, 137),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state is HotelLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is HotelLoadedState) {
          return SizedBox(
            height: 257,
            width: double.infinity,
            child: PageView.builder(
              itemCount: state.hotel.imageUrls.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 257,
                    width: double.infinity,
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          state.hotel.imageUrls[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                      DotsIndicator(
                        dotsCount: state.hotel.imageUrls.length,
                        decorator: const DotsDecorator(
                          color: Color.fromARGB(80, 0, 0, 0), // Inactive color
                          activeColor: Colors.black,
                        ),
                        position: index,
                      ),
                    ]),
                  ),
                );
              },
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
