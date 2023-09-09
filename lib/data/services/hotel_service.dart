import 'dart:io';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hotels_app/domain/hotel.dart';

import 'package:hotels_app/domain/hotel_rooms.dart';
import 'package:hotels_app/domain/room_reservation.dart';


import '../failure.dart';

class HotelService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: dotenv.get('BASE_URL'),
    ),
  );

  getData() {
    developer.log(_dio.options.baseUrl, name: 'URL:');
  }

  /// Получаем данные об отеле
  Future<Hotel> getHotel() async {
    try {
      final response = await _dio.get('/35e0d18e-2521-4f1b-a575-f0fe366f66e3');
      return Hotel.fromJson(response.data);
    } catch (e) {
      return _handleError(e);
    }
  }

  /// Получаем данные о номерах
  Future<HotelRooms> getHotelRooms() async {
    try {
      final response = await _dio.get('/f9a38183-6f95-43aa-853a-9c83cbb05ecd');
      return HotelRooms.fromJson(response.data);
    } catch (e) {
      return _handleError(e);
    }
  }

  /// Получаем данные о номере
  Future<RoomReservation> getRoomReservation() async {
    try {
      final response = await _dio.get('/e8868481-743f-4eb2-a0d7-2bc4012275c8');
      return RoomReservation.fromJson(response.data);
    } catch (e) {
      return _handleError(e);
    }
  }

  /// Обработка ошибок
  _handleError(error) {
    if (error is SocketException) {
      throw Failure('Нет интернет соединения 😑');
    } else if (error is FormatException) {
      throw Failure("Неверный формат ответа 👎");
    } else if (error is Exception || error is DioException) {
      throw Failure("Ошибка при выполнении запроса 😱");
    }
  }
}













// import 'dart:developer' as developer;
// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// import '../../domain/hotel.dart';
// import '../../domain/hotel_rooms.dart';
// import '../../domain/room_reservation.dart';
// import '../failure.dart';

// class HotelService {
//   final Dio _dio = Dio(
//     BaseOptions(
//       baseUrl: dotenv.get('BASE_URL'),
//     ),
//   );

//   /// Получаем данные об отеле
//   Future<Hotel> getHotel() async {
//     try {
//       final response = await _dio.get('/35e0d18e-2521-4f1b-a575-f0fe366f66e3');
//       developer.log(response.data, name: 'GET_HOTEL:');
//       return Hotel.fromJson(response.data);
//     } catch (e) {
//             developer.log(у, name: 'GET_ERROR:');
//       return _handleError(e);
//     }
//   }

//   /// Получаем данные о номерах
//   Future<HotelRooms> getHotelRooms() async {
//     try {
//       final response = await _dio.get('/f9a38183-6f95-43aa-853a-9c83cbb05ecd');
//       return HotelRooms.fromJson(response.data);
//     } catch (e) {
//       return _handleError(e);
//     }
//   }

//   /// Получаем данные о номере
//   Future<RoomReservation> getRoomReservation() async {
//     try {
//       final response = await _dio.get('/e8868481-743f-4eb2-a0d7-2bc4012275c8');
//       return RoomReservation.fromJson(response.data);
//     } catch (e) {
//       return _handleError(e);
//     }
//   }

//   /// Обработка ошибок
//   _handleError(error) {
//     if (error is SocketException) {
//       throw Failure('Нет интернет соединения 😑');
//     } else if (error is FormatException) {
//       throw Failure("Неверный формат ответа 👎");
//     } else if (error is Exception || error is DioException) {
//       throw Failure("Ошибка при выполнении запроса 😱");
//     }
//   }
// }
