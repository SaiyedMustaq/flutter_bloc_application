part of 'products_cubit.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {
  final List<Product> listProduct;

  ProductsLoading(this.listProduct);
}

class ProductLoaded extends ProductsState {
  final List<Product> listProduct;
  ProductLoaded(this.listProduct);
  @override
  List<Object> get props => [];
}
