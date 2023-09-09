import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_app/data/failure.dart';
import 'package:hotels_app/domain/hotel_rooms.dart';
import 'package:hotels_app/repository/hotel_repository.dart';

part 'hotel_rooms_state.dart';
part 'hotel_rooms_event.dart';

class HotelRoomsBloc extends Bloc<HotelRoomsEvent, HotelRoomsState> {
  final HotelRepository hotelRepository;

  HotelRoomsBloc({required this.hotelRepository})
      : super(HotelRoomsLoadingState()) {
    on<HotelRoomsLoadEvent>((event, emit) async {
      emit(HotelRoomsLoadingState());
      try {
        final hotel = await hotelRepository.getHotelRooms();
        emit(HotelRoomsLoadedState(hotel));
      } on Failure catch (e) {
        emit(HotelRoomsErrorState(e.message));
      }
    });
  }
}
