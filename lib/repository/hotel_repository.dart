import '../data/services/hotel_service.dart';
import '../domain/hotel.dart';
import '../domain/hotel_rooms.dart';
import '../domain/room_reservation.dart';

class HotelRepository {
  final HotelService hotelDataSource;

  HotelRepository({required this.hotelDataSource});

  /// Получаем данные об отеле
  Future<Hotel> getHotel() async {
    return hotelDataSource.getHotel();
  }

  /// Получаем данные о номерах
  Future<HotelRooms> getHotelRooms() async {
    return hotelDataSource.getHotelRooms();
  }

  /// Получаем данные о номере
  Future<RoomReservation> getRoomReservation() async {
    return hotelDataSource.getRoomReservation();
  }
}
