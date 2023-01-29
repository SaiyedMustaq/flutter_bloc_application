import 'dart:convert';

class ShopData {
  List<ShopItem> shopItemList;
  ShopData({
    required this.shopItemList,
  });
}

class ShopItem {
  String imagUrl;
  String thymbnail;
  String title;
  String price;
  int quantity;
  ShopItem({
    required this.imagUrl,
    required this.thymbnail,
    required this.title,
    required this.price,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'imagUrl': imagUrl,
      'thymbnail': thymbnail,
      'title': title,
      'price': price,
      'quantity': quantity,
    };
  }

  factory ShopItem.fromMap(Map<String, dynamic> map) {
    return ShopItem(
      imagUrl: map['imagUrl'],
      thymbnail: map['thymbnail'],
      title: map['title'],
      price: map['price'],
      quantity: map['quantity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ShopItem.fromJson(String source) =>
      ShopItem.fromMap(json.decode(source));
}
