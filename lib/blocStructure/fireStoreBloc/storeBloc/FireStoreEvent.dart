import 'package:equatable/equatable.dart';

import '../mdoel/ItemModel.dart';

abstract class FireStoreEvent extends Equatable {
  const FireStoreEvent();
}

//INFO PAGE LIST LOADING
class FireStoreItemsLoadingEvent extends FireStoreEvent {
  const FireStoreItemsLoadingEvent();
  @override
  List<Object?> get props => [];
}

//INFO FIRE STORE GET DATA EVENT
class FireStoreItemFetchEvent extends FireStoreEvent {
  final List<ItemModel> listFireStoreItem;
  const FireStoreItemFetchEvent({
    required this.listFireStoreItem,
  });
  @override
  List<Object?> get props => [listFireStoreItem];
}

//INFO GET FAVORITE EVENT
class FavoriteItemLoadingEvent extends FireStoreEvent {
  const FavoriteItemLoadingEvent();
  @override
  List<Object?> get props => [];
}

//INFO FAVORITE ITEM ADD EVENT
class FavoriteItemAddEvent extends FireStoreEvent {
  final ItemModel cartModel;
  final String docId;
  final bool value;
  final int index;
  const FavoriteItemAddEvent(
      {required this.cartModel,
      required this.docId,
      required this.value,
      required this.index});
  @override
  List<Object?> get props => [cartModel, docId, value];
}

//INFO FAVORITE ITEM REMOVE EVENT
class FavoriteItemRemoveEvent extends FireStoreEvent {
  final String? docId;
  final bool? value;
  final int? index;

  const FavoriteItemRemoveEvent({this.docId, this.value, this.index});
  @override
  List<Object?> get props => [docId, value, index];
}

//INFO CART ITEM LOADING EVENT
class CartItemLoadingEvent extends FireStoreEvent {
  @override
  List<Object?> get props => [];
}

//INFO CART ITEM LISTING
class CartItemGetList extends FireStoreEvent {
  final List<ItemModel>? cartItemModelList;
  const CartItemGetList(this.cartItemModelList);
  @override
  List<Object?> get props => [cartItemModelList];
}

//INFO  CART ITEM ADD EVENT
class CartItemAddEvent extends FireStoreEvent {
  final ItemModel? cartModel;
  final String? docId;
  final bool? value;
  const CartItemAddEvent({this.cartModel, this.docId, this.value});
  @override
  List<Object?> get props => [cartModel, docId, value];
}
