part of 'room_reservation_bloc.dart';

abstract class RoomReservationState {}

class RoomReservationLoadingState extends RoomReservationState {}

class RoomReservationLoadedState extends RoomReservationState {
  final RoomReservation room;

  RoomReservationLoadedState(this.room);
}

class RoomReservationErrorState extends RoomReservationState {
  final String message;

  RoomReservationErrorState(this.message);
}
