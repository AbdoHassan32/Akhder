part of 'insecticides_products_cubit.dart';

@immutable
abstract class InsecticidesProductsState {}

class InsecticidesProductsInitial extends InsecticidesProductsState {}

class InsecticidesProductsLoading extends InsecticidesProductsState {}

class InsecticidesProductsSuccess extends InsecticidesProductsState {
  final List<Product> products;
  InsecticidesProductsSuccess(this.products);
}

class InsecticidesProductsFailure extends InsecticidesProductsState {
  final String errMessage;
  InsecticidesProductsFailure(this.errMessage);
}
