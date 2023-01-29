import 'package:equatable/equatable.dart';

import '../../fireStoreBloc/mdoel/ItemModel.dart';
import '../shopModel/Shop.dart';

abstract class ShopState extends Equatable {
  ShopState();
  @override
  List<Object> get props => [];
}

/// Initialized
class ShopInitial extends ShopState {}

class ShopPageLoadingState extends ShopState {
  ShopData shopDate;
  ShopData cartItem;
  ShopPageLoadingState({
    required this.shopDate,
    required this.cartItem,
  });
}

class ItemAddingState extends ShopState {
  ShopData productItem;
  List<ShopItem> listShopItem;
  ItemAddingState({
    required this.productItem,
    required this.listShopItem,
  });
}

class ItemAddState extends ShopState {
  ItemModel cartModel;
  ItemAddState({
    required this.cartModel,
  });
}

class ItemDeletedState extends ShopState {
  List<ShopItem> listShopItem;
  ItemDeletedState({
    required this.listShopItem,
  });
}

class ItemAddSuccessState extends ShopState {
  final String message;
  ItemAddSuccessState({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

class ErrorShopState extends ShopState {
  ErrorShopState(this.errorMessage);
  final String errorMessage;
  @override
  String toString() => 'ErrorShopState';

  @override
  List<Object> get props => [errorMessage];
}
