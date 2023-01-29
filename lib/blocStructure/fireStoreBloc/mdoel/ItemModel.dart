class ItemModel {
  late String id;
  late String name;
  late String imageUrl;
  late bool isCard;
  late bool isFav;
  late String off;
  late String description;
  late num price;
  late num sellPrice;

  ItemModel(
      {required this.id,
      required this.name,
      required this.isCard,
      required this.isFav,
      required this.sellPrice,
      required this.off,
      required this.description,
      required this.imageUrl,
      required this.price});
}

List<ItemModel> ItemList = [
  // CartModel(
  //     id: "0",
  //     name: "Apple",
  //     isCard: false,
  //     isFav: false,
  //     off: '',
  //     descreption: "",
  //     imageUrl: 'https://m.media-amazon.com/images/I/71w3oJ7aWyL._SL1500_.jpg',
  //     price: '₹43,999.00'),
  // CartModel(
  //     id: "1",
  //     name: "Samsung",
  //     descreption: "",
  //     isCard: false,
  //     isFav: false,
  //     off: '',
  //     imageUrl: 'https://m.media-amazon.com/images/I/71w3oJ7aWyL._SL1500_.jpg',
  //     price: '₹45,999.00'),
  // CartModel(
  //     id: "2",
  //     name: "Poco",
  //     isCard: false,
  //     descreption: "",
  //     isFav: false,
  //     off: '',
  //     imageUrl: 'https://m.media-amazon.com/images/I/31f1QZweeuL.jpg',
  //     price: '₹15,999.00'),
  // CartModel(
  //     id: "3",
  //     name: "Oppo",
  //     isCard: false,
  //     isFav: false,
  //     off: '',
  //     descreption: "",
  //     imageUrl: 'https://m.media-amazon.com/images/I/71poFSdDs5S._SL1500_.jpg',
  //     price: '₹17,999.00'),
  // CartModel(
  //     id: "4",
  //     name: "One Plus",
  //     descreption: "",
  //     isFav: false,
  //     off: '',
  //     isCard: false,
  //     imageUrl: 'https://m.media-amazon.com/images/I/61TnX0PmqES._SL1500_.jpg',
  //     price: '₹20,999.00'),
  // CartModel(
  //     id: "5",
  //     name: "Realme",
  //     isCard: false,
  //     isFav: false,
  //     off: '',
  //     descreption: "",
  //     imageUrl: 'https://m.media-amazon.com/images/I/71CmG44Al4S._SL1500_.jpg',
  //     price: '₹18,999.00'),
  // CartModel(
  //     id: "6",
  //     name: "Mi",
  //     isFav: false,
  //     off: '',
  //     isCard: false,
  //     descreption: "",
  //     imageUrl: 'https://m.media-amazon.com/images/I/71w4n2itCNL._SL1500_.jpg',
  //     price: '₹15,999.00'),
  // CartModel(
  //     id: "7",
  //     name: "Samsung",
  //     descreption: "",
  //     isFav: false,
  //     off: '',
  //     isCard: false,
  //     imageUrl: 'https://m.media-amazon.com/images/I/812yohjGZ2L._SL1500_.jpg',
  //     price: '₹16,999.00'),
];

List<ItemModel> favoriteItem = [];
List<ItemModel> cartItem = [];
