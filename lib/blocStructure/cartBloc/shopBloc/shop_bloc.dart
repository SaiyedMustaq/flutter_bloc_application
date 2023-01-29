import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_application/blocStructure/cartBloc/shopBloc/shop_event.dart';
import 'package:flutter_bloc_application/blocStructure/cartBloc/shopBloc/shop_state.dart';

import '../../fireStoreBloc/mdoel/ItemModel.dart';
import '../shopRepository/shopDataProvider.dart';


class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopDataProvider shopDataProvider = ShopDataProvider();
  ShopBloc() : super(ShopInitial()) {
    add(ShopInitialEvent());
  }

  @override
  Stream<ShopState> mapEventToState(
    ShopEvent event,
  ) async* {
    try {
      if (event is ItemAddingEvent) {
        yield ItemAddState(cartModel: event.cartModel);
        cartItem.add(event.cartModel);
        yield ItemAddSuccessState(message: 'Item add into cart');
      }
    } catch (_, stackTrace) {
      developer.log('$_', name: 'ShopBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
