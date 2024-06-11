import 'package:flutter/cupertino.dart';

import '../../../data/models/product.dart';

@immutable
abstract class AllProductsState {}

class AllProductsInitial extends AllProductsState {}
class AllProductsLoading extends AllProductsState {}

class AllProductsSuccess extends AllProductsState {
  final List<Product> products;
  AllProductsSuccess(this.products);
}

class AllProductsFailure extends AllProductsState {
  final String errMessage;
  AllProductsFailure(this.errMessage);
}