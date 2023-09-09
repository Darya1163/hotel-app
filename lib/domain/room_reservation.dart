class RoomReservation {
  int id;
  String hotelName;
  String hotelAdress;
  int horating;
  String ratingName;
  String departure;
  String arrivalCountry;
  String tourDateStart;
  String tourDateStop;
  int numberOfNights;
  String room;
  String nutrition;
  int tourPrice;
  int fuelCharge;
  int serviceCharge;

  RoomReservation(
      {required this.id,
      required this.hotelName,
      required this.hotelAdress,
      required this.horating,
      required this.ratingName,
      required this.departure,
      required this.arrivalCountry,
      required this.tourDateStart,
      required this.tourDateStop,
      required this.numberOfNights,
      required this.room,
      required this.nutrition,
      required this.tourPrice,
      required this.fuelCharge,
      required this.serviceCharge});

  factory RoomReservation.fromJson(Map<String, dynamic> json) {
    return RoomReservation(
      id: json["id"],
      hotelName: json["hotel_name"],
      hotelAdress: json["hotel_adress"],
      horating: json["horating"],
      ratingName: json["rating_name"],
      departure: json["departure"],
      arrivalCountry: json["arrival_country"],
      tourDateStart: json["tour_date_start"],
      tourDateStop: json["tour_date_stop"],
      numberOfNights: json["number_of_nights"],
      room: json["room"],
      nutrition: json["nutrition"],
      tourPrice: json["tour_price"],
      fuelCharge: json["fuel_charge"],
      serviceCharge: json["service_charge"],
    );
  }

  RoomReservation copyWith({
    int? id,
    String? hotelName,
    String? hotelAdress,
    int? horating,
    String? ratingName,
    String? departure,
    String? arrivalCountry, 
    String? tourDateStart,
    String? tourDateStop,
    int? numberOfNights,
    String? room,
    String? nutrition,
    int? tourPrice,
    int? fuelCharge,
    int? serviceCharge,
  }) =>
      RoomReservation(
        id: id ?? this.id,
        hotelName: hotelName ?? this.hotelName,
        hotelAdress: hotelAdress ?? this.hotelAdress,
        horating: horating ?? this.horating,
        ratingName: ratingName ?? this.ratingName,
        departure: departure ?? this.departure,
        arrivalCountry: arrivalCountry ?? this.arrivalCountry,
        tourDateStart: tourDateStart ?? this.tourDateStart,
        tourDateStop: tourDateStop ?? this.tourDateStop,
        numberOfNights: numberOfNights ?? this.numberOfNights,
        room: room ?? this.room,
        nutrition: nutrition ?? this.nutrition,
        tourPrice: tourPrice ?? this.tourPrice,
        fuelCharge: fuelCharge ?? this.fuelCharge,
        serviceCharge: serviceCharge ?? this.serviceCharge,
      );
}
