import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import '../../../repos/model/product.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitial());
  final ProductRepo productRepo;

  void productLoading() {
    if (state is ProductsLoading) return;
    final currentState = state;
    var oldProductList = <Product>[];

    if (currentState is ProductLoaded) {
      oldProductList = currentState.listProduct;
    }
    emit(ProductsLoading(oldProductList));
    productRepo.fetchProduct().then((value) {
      final productList = (state as ProductsLoading).listProduct;
      productList.addAll(value);
      //emit(PostLoaded(productList));
    });
  }
}

class ProductRepo {
  final ProductServices productServices;

  ProductRepo(this.productServices);
  Future<List<Product>> fetchProduct() async {
    final productData = await productServices.fetchProduct();
    return productData.map((e) => Product.fromJson(e)).toList();
  }
}

class ProductServices {
  static const FETCH_LIMIT = 9;
  final baseUrl = 'https://fakestoreapi.com/products';

  Future<List<dynamic>> fetchProduct() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      return productFromJson(response.body);
    } catch (e) {
      return [];
    }
  }
}
