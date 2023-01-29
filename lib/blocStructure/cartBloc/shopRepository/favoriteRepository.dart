import '../../fireStoreBloc/mdoel/ItemModel.dart';

class FavoriteRepository {
  Future<List<ItemModel>> getCartItem() async {
    return favoriteItem;
  }
}
