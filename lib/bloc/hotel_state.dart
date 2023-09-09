part of 'hotel_bloc.dart';

@immutable
abstract class HotelState {}

class HotelLoadingState extends HotelState {}

class HotelLoadedState extends HotelState {
  final Hotel hotel;

  HotelLoadedState(this.hotel);
}

class HotelErrorState extends HotelState {
  final String message;

  HotelErrorState(this.message);
}
