import 'package:equatable/equatable.dart';

import '../../fireStoreBloc/mdoel/ItemModel.dart';
import '../shopModel/Shop.dart';

abstract class ShopEvent extends Equatable {
  const ShopEvent();

  @override
  List<Object> get props => [];
}

class ShopInitialEvent extends ShopEvent {}

class ItemAddingEvent extends ShopEvent {
  ItemModel cartModel;
  ItemAddingEvent({
    required this.cartModel,
  });
}

class ItemAddCartEvent extends ShopEvent {
  List<ShopItem> cartItem;
  ItemAddCartEvent({
    required this.cartItem,
  });
}

class ItemDeleteCartevent extends ShopEvent {
  List<ShopItem> cartItem;
  int? index;
  ItemDeleteCartevent({required this.cartItem, this.index});
}
