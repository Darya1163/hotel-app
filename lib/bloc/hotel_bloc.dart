import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/failure.dart';
import '../domain/hotel.dart';
import '../repository/hotel_repository.dart';


part 'hotel_state.dart';
part 'hotel_event.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final HotelRepository hotelRepository;

  HotelBloc({required this.hotelRepository}) : super(HotelLoadingState()) {
    on<HotelLoadEvent>((event, emit) async {
      emit(HotelLoadingState());
      try {
        final hotel = await hotelRepository.getHotel();
        emit(HotelLoadedState(hotel));
      } on Failure catch (e) {
        emit(HotelErrorState(e.message));
      }
    });
  }
}
