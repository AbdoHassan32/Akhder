part of 'corps_products_cubit.dart';

@immutable
abstract class CorpsProductsState {}

class CorpsProductsInitial extends CorpsProductsState {}
class CorpsProductsLoading extends CorpsProductsState {}

class CorpsProductsSuccess extends CorpsProductsState {
  final List<Product> products;
  CorpsProductsSuccess(this.products);
}

class CorpsProductsFailure extends CorpsProductsState {
  final String errMessage;
  CorpsProductsFailure(this.errMessage);
}