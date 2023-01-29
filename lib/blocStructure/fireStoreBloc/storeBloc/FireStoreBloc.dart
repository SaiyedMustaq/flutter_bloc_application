import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cartBloc/shopRepository/favoriteRepository.dart';
import '../mdoel/ItemModel.dart';
import '../repository/FIrebaseGetDataRepository.data.dart';
import '../repository/fireStore.dar.dart';
import 'FireStoreExpo.dart';

enum CartEvent { ADD, REMOVE }

class FireStoreBloc extends Bloc<FireStoreEvent, FireStoreState> {
  FireStoreBloc({this.fireStoreApi}) : super(FireStoreItemsInitial());
  FavoriteRepository favoriteRepository = FavoriteRepository();
  FireStoreApi? fireStoreApi;
  FirebaseGetDataRepository firebaseGetDataRepository =
      FirebaseGetDataRepository();
  List<ItemModel> itemModel = [];

  @override
  Stream<FireStoreState> mapEventToState(
    FireStoreEvent event,
  ) async* {
    if (event is FireStoreItemsLoadingEvent) {
      print('FavoriteItemsInitEvent');
      yield FireStoreItemsLoadingState();
      try {
        itemModel.addAll(await firebaseGetDataRepository.fetchData());
        yield FireStoreItemFetchState(fireStoreList: itemModel);
      } on SocketException {
        yield FireStoreErrorState('No Internet Available');
      } on HttpException {
        yield FireStoreErrorState('No Service');
      } on FormatException {
        yield FireStoreErrorState('No Format Exception');
      } catch (e) {
        yield FireStoreErrorState(e.toString());
      }
    } else if (event is FavoriteItemAddEvent) {
      //NOTE FAVORITE ITEM ADD IN LIST

      try {
        await firebaseGetDataRepository.addFavorite(
          id: event.docId,
          value: event.value,
        );
        yield FavoriteItemAddState('Favorite Add');
        itemModel[event.index].isFav = event.value;
        yield FireStoreItemFetchState(fireStoreList: itemModel);
      } catch (e) {
        print('Event Error $e');
      }
    } else if (event is FavoriteItemRemoveEvent) {
      //NOTE FAVORITE ITEM REMOVE IN LIST
      try {
        await firebaseGetDataRepository.removeFavorite(
          id: event.docId,
          value: event.value,
        );
        yield FavoriteItemAddState('Remove Fav');

        itemModel[event.index!].isFav = event.value!;
        yield FireStoreItemFetchState(fireStoreList: itemModel);
      } on Exception catch (e) {
        print('Remove Item $e');
      }
    } else if (event is FavoriteItemLoadingEvent) {
      itemModel = await firebaseGetDataRepository.getFavorite();
      yield FireStoreItemFetchState(fireStoreList: itemModel);
    } else if (event is CartItemAddEvent) {
      //NOTE ADD TO CART
      yield ItemCartAddState(
          message:
              await firebaseGetDataRepository.addToCartData(event.cartModel!));
    } else if (event is CartItemLoadingEvent) {
      //NOTE CART ITEM FETCH
      yield CartItemLoadingState();
      itemModel = await firebaseGetDataRepository.getCartList();
      int cartTotal = await firebaseGetDataRepository.getCartTotal();
      yield CartItemFetchState(itemCartList: itemModel, cartTotal: cartTotal);
    } else if (event is FireStoreItemsLoadingEvent) {
      //NOTE FAVORITE ITEM FETCH EVENT

    }
  }
}
