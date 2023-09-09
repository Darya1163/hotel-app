import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_app/data/failure.dart';
import 'package:hotels_app/domain/room_reservation.dart';
import 'package:hotels_app/repository/hotel_repository.dart';

part 'room_reservation_state.dart';
part 'room_reservation_event.dart';

class RoomReservationBloc
    extends Bloc<RoomReservationEvent, RoomReservationState> {
  final HotelRepository hotelRepository;

  RoomReservationBloc({required this.hotelRepository})
      : super(RoomReservationLoadingState()) {
    on<RoomReservationLoadEvent>((event, emit) async {
      emit(RoomReservationLoadingState());
      try {
        final hotel = await hotelRepository.getRoomReservation();
        emit(RoomReservationLoadedState(hotel));
      } on Failure catch (e) {
        emit(RoomReservationErrorState(e.message));
      }
    });
  }
}
