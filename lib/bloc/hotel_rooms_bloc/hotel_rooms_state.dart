part of 'hotel_rooms_bloc.dart';

abstract class HotelRoomsState {}

class HotelRoomsLoadingState extends HotelRoomsState {}

class HotelRoomsLoadedState extends HotelRoomsState {
  final HotelRooms hotelRooms;

  HotelRoomsLoadedState(this.hotelRooms);
}

class HotelRoomsErrorState extends HotelRoomsState {
  final String message;

  HotelRoomsErrorState(this.message);
}
