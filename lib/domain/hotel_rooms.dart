class HotelRooms {
  List<Room> rooms;

  HotelRooms({required this.rooms});

  factory HotelRooms.fromJson(Map<String, dynamic> json) {
    return HotelRooms(
        rooms: (json["rooms"] as List).map((e) => Room.fromJson(e)).toList());
  }
}

class Room {
  int id;
  String name;
  int price;
  String pricePer;
  List<String> peculiarities;
  List<String> imageUrls;

  Room(
      {required this.id,
      required this.name,
      required this.price,
      required this.pricePer,
      required this.peculiarities,
      required this.imageUrls});

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      pricePer: json["price_per"],
      peculiarities: json["peculiarities"] == null
          ? []
          : List<String>.from(json["peculiarities"]),
      imageUrls: json["image_urls"] == null
          ? []
          : List<String>.from(json["image_urls"])
              .map((e) => Uri.decodeFull(e))
              .toList(),
    );
  }

  Room copyWith({
    int? id,
    String? name,
    int? price,
    String? pricePer,
    List<String>? peculiarities,
    List<String>? imageUrls,
  }) =>
      Room(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        pricePer: pricePer ?? this.pricePer,
        peculiarities: peculiarities ?? this.peculiarities,
        imageUrls: imageUrls ?? this.imageUrls,
      );
}