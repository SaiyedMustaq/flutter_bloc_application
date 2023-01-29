import '../mdoel/ItemModel.dart';

abstract class FireStoreApi {
  Future<List<ItemModel>> fetchData();
}
