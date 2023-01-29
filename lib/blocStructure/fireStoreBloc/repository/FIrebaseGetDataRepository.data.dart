import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../mdoel/ItemModel.dart';
import 'fireStore.dar.dart';

class FirebaseGetDataRepository implements FireStoreApi {
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  List<ItemModel> itemList = [];
  List<ItemModel> cartList = [];
  List<ItemModel> favList = [];
  final String collection = 'flipecart';
  final String cartCollection = 'carttable';
  CollectionReference cartTable =
      FirebaseFirestore.instance.collection('carttable');

  fetchData() async {
    EasyLoading.show(status: '', maskType: EasyLoadingMaskType.black);
    await firebaseFireStore.collection(collection).get().then(
      (querySnapshot) {
        querySnapshot.docs.forEach((element) {
          print('querySnapshot ===>> ${element.id} ');
          itemList.add(ItemModel(
              id: element.id,
              isCard: element.data()['isCart'],
              isFav: element.data()['isFav'],
              name: element.data()['name'].toString().trim(),
              description: element.data()['description'].toString().trim(),
              imageUrl: element.data()['image'].toString().trim(),
              off: element.data()['off'].toString().trim(),
              price: element.data()['price'],
              sellPrice: element.data()['sellprice']));
        });
      },
    );
    EasyLoading.dismiss();
    return itemList;
  }

  addToCartData(ItemModel addCartModel) async {
    await EasyLoading.show(status: '', maskType: EasyLoadingMaskType.black);
    cartTable.add({
      "id": addCartModel.id,
      "description": "${addCartModel.description}",
      "highlights": [],
      "image": "${addCartModel.imageUrl}",
      "isCart": "${addCartModel.isCard != addCartModel.isCard}",
      "isFav": "${addCartModel.isFav}",
      'name': "${addCartModel.name}",
      "off": "${addCartModel.off}",
      'price': "${addCartModel.price}",
      "ratings": "4",
      "sellprice": "${addCartModel.sellPrice}",
    }).then((value) {
      print("User Added");
      EasyLoading.dismiss();
    }).catchError((error) {
      print("Failed to add user: $error");
    });
  }

  addFavorite({required String id, required bool value}) async {
    await FirebaseFirestore.instance.doc('$collection/$id').update({
      'isFav': value,
    });
  }

  removeFavorite({String? id, bool? value}) async {
    await FirebaseFirestore.instance.doc('$collection/$id').update({
      'isFav': value,
    });
  }

  Future<List<ItemModel>> getCartList() async {
    EasyLoading.show(status: '', maskType: EasyLoadingMaskType.black);
    await firebaseFireStore.collection("$cartCollection").get().then(
      (querySnapshot) {
        querySnapshot.docs.forEach((element) {
          print('querySnapshot ===>> ${element.id} ');
          cartList.add(ItemModel(
              id: element.id,
              isCard: element.data()['isCart'],
              isFav: element.data()['isFav'],
              name: element.data()['name'].toString().trim(),
              description: element.data()['description'].toString().trim(),
              imageUrl: element.data()['image'].toString().trim(),
              off: element.data()['off'].toString().trim(),
              price: element.data()['price'],
              sellPrice: element.data()['sellprice']));
        });
      },
    );
    EasyLoading.dismiss();
    return cartList;
  }

  Future<int> getCartTotal() async {
    int cartTotal = 0;
    await firebaseFireStore.collection("$cartCollection").get().then(
      (querySnapshot) {
        querySnapshot.docs.forEach((element) {
          print('sell price ===>> ${element.data()['sellprice']} ');
          cartTotal =
              cartTotal + int.parse(element.data()['sellprice'].toString());
        });
      },
    );
    return cartTotal;
  }

  Future<List<ItemModel>> getFavorite() async {
    EasyLoading.show(status: '', maskType: EasyLoadingMaskType.black);
    await firebaseFireStore
        .collection('$collection')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        if (element.data()['isFav']) {
          favList.add(ItemModel(
              id: element.id,
              isCard: element.data()['isCart'],
              isFav: element.data()['isFav'],
              name: element.data()['name'].toString().trim(),
              description: element.data()['description'].toString().trim(),
              imageUrl: element.data()['image'].toString().trim(),
              off: element.data()['off'].toString().trim(),
              price: element.data()['price'],
              sellPrice: element.data()['sellprice']));
        }
      });
    });
    EasyLoading.dismiss();
    return favList;
  }
}
