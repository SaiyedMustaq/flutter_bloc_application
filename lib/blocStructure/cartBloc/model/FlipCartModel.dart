class FlipCartModel {
  String? name;
  String? descreption;
  String? image;
  String? off;
  String? price;
  List<String>? images;

  FlipCartModel(
      {required
        this.name,
      required this.descreption,
      required this.image,
      required this.off,
      required this.price,
      required this.images});

  FlipCartModel.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    descreption = json['Descreption'];
    image = json['Image'];
    off = json['off'];
    price = json['Price'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Descreption'] = this.descreption;
    data['Image'] = this.image;
    data['off'] = this.off;
    data['Price'] = this.price;
    data['images'] = this.images;
    return data;
  }
}
