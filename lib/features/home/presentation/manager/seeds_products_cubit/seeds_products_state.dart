part of 'seeds_products_cubit.dart';

@immutable
abstract class SeedsProductsState {}

class SeedsProductsInitial extends SeedsProductsState {}
class SeedsProductsLoading extends SeedsProductsState {}

class SeedsProductsSuccess extends SeedsProductsState {
  final List<Product> products;
  SeedsProductsSuccess(this.products);
}

class SeedsProductsFailure extends SeedsProductsState {
  final String errMessage;
  SeedsProductsFailure(this.errMessage);
}