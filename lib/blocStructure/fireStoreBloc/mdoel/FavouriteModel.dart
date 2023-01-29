class FavouriteModel {
  final  String? id;
  final String? name;
  final String? imageUrl;
  final bool? isCard;
  final bool? isFav;
  final String? off;
  final String? description;
  final String? price;
  final String? sellPrice;

  FavouriteModel({
    this.id,
    this.name,
    this.imageUrl,
    this.isCard,
    this.isFav,
    this.off,
    this.description,
    this.price,
    this.sellPrice,}
  );

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "imageUrl": this.imageUrl,
      "isCard": this.isCard,
      "isFav": this.isFav,
      "off": this.off,
      "description": this.description,
      "price": this.price,
      "sellPrice": this.sellPrice,
    };
  }

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
      id: json["id"],
      name: json["name"],
      imageUrl: json["imageUrl"],
      isCard: json["isCard"].toLowerCase() == 'true',
      isFav: json["isFav"].toLowerCase() == 'true',
      off: json["off"],
      description: json["description"],
      price: json["price"],
      sellPrice: json["sellPrice"],
    );
  }
}
