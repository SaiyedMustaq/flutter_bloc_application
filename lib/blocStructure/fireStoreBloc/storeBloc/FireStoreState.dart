import 'package:equatable/equatable.dart';
import '../mdoel/ItemModel.dart';

abstract class FireStoreState extends Equatable {
  const FireStoreState();
}

//INFO FIRE STORE ITEM INITIAL STATE
class FireStoreItemsInitial extends FireStoreState {
  @override
  List<Object?> get props => [];
}

//INFO FIRE STORE ITEM LOADING STATE
class FireStoreItemsLoadingState extends FireStoreState {
  const FireStoreItemsLoadingState();
  @override
  List<Object?> get props => [];
}

//INFO FIRE STORE ITEM FETCH STATE

class FireStoreItemFetchState extends FireStoreState {
  final List<ItemModel> fireStoreList;
  const FireStoreItemFetchState({required this.fireStoreList});
  @override
  List<Object?> get props => [fireStoreList];
}

//INFO FIRE STORE ITEM ERROR STATE
class FireStoreErrorState extends FireStoreState {
  final String error;
  const FireStoreErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

//INFO FAVORITE ITEM ADD STATE
class FavoriteItemAddState extends FireStoreState {
  final String message;
  const FavoriteItemAddState(this.message);
  @override
  List<Object?> get props => [message];
}

//INFO FAVORITE ITEM REMOVE STATE
class FavoriteItemRemove extends FireStoreState {
  final String docId;
  const FavoriteItemRemove(this.docId);
  @override
  List<Object?> get props => [docId];
}

//INFO CART ADD ITEM LOADING STATE
class ItemCartAddState extends FireStoreState {
  final String? message;
  const ItemCartAddState({this.message});

  @override
  List<Object?> get props => [message];
}

//INFO CART REMOVE ITEM LOADING STATE
class ItemCartRemoveState extends FireStoreState {
  final String? message;
  const ItemCartRemoveState({this.message});

  @override
  List<Object?> get props => [message];
}

//INFO CART ITEM LOADING STATE
class CartItemLoadingState extends FireStoreState {
  const CartItemLoadingState();
  @override
  List<Object?> get props => [];
}

//INFO CART ITEM GET LIST STATE
// ignore: must_be_immutable
class CartItemFetchState extends FireStoreState {
  List<ItemModel> itemCartList;
  final num cartTotal;
  CartItemFetchState({required this.itemCartList, required this.cartTotal});
  @override
  List<Object?> get props => [itemCartList, cartTotal];
}

//INFO CART ITEM FETCH GETTING ERROR
class CartGetTingListError extends FireStoreState {
  final String? errorMessage;
  const CartGetTingListError({this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
