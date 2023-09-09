class Hotel {
  int id;
  String name;
  String adress;
  int minimalPrice;
  String priceForIt;
  int rating;
  String ratingName;
  List<String> imageUrls;
  AboutTheHotel aboutTheHotel;

  Hotel({
    required this.id,
    required this.name,
    required this.adress,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      name: json['name'],
      adress: json['adress'],
      minimalPrice: json['minimal_price'],
      priceForIt: json['price_for_it'],
      rating: json['rating'],
      ratingName: json['rating_name'],
      imageUrls: json["image_urls"] == null
          ? []
          : List<String>.from(json["image_urls"])
              .map((e) => Uri.decodeFull(e))
              .toList(),
      aboutTheHotel: AboutTheHotel(
        description: json['about_the_hotel']['description'],
        peculiarities: json['about_the_hotel'] == null ||
                json['about_the_hotel']['peculiarities'] == null
            ? []
            : List<String>.from(json['about_the_hotel']['peculiarities']),
      ),
    );
  }
}

class AboutTheHotel {
  String? description;
  List<String>? peculiarities;

  AboutTheHotel({required this.description, required this.peculiarities});
}
