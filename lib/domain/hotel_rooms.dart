class HotelRooms {
  List<Rooms> rooms;

  HotelRooms({required this.rooms});

  factory HotelRooms.fromJson(Map<String, dynamic> json) {
    return HotelRooms(
        rooms: (json["rooms"] as List).map((e) => Rooms.fromJson(e)).toList());
  }
}

class Rooms {
  int id;
  String name;
  int price;
  String? pricePer;
  List<String>? peculiarities;
  List<String>? imageUrls;

  Rooms(
      {required this.id,
      required this.name,
      required this.price,
      this.pricePer,
      this.peculiarities,
      this.imageUrls});

  factory Rooms.fromJson(Map<String, dynamic> json) {
    return Rooms(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      pricePer: json["price_per"],
      peculiarities: json["peculiarities"] == null
          ? []
          : List<String>.from(json["peculiarities"]),
      imageUrls: json["image_urls"] == null
          ? []
          : List<String>.from(json["image_urls"]),
    );
  }

  Rooms copyWith({
    int? id,
    String? name,
    int? price,
    String? pricePer,
    List<String>? peculiarities,
    List<String>? imageUrls,
  }) =>
      Rooms(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        pricePer: pricePer ?? this.pricePer,
        peculiarities: peculiarities ?? this.peculiarities,
        imageUrls: imageUrls ?? this.imageUrls,
      );
}
