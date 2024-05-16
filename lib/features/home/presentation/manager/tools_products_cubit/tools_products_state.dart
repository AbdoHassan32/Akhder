part of 'tools_products_cubit.dart';

@immutable
abstract class ToolsProductsState {}

class ToolsProductsInitial extends ToolsProductsState {}

class ToolsProductsLoading extends ToolsProductsState {}

class ToolsProductsSuccess extends ToolsProductsState {
  final List<Product> products;
  ToolsProductsSuccess(this.products);
}

class ToolsProductsFailure extends ToolsProductsState {
  final String errMessage;
  ToolsProductsFailure(this.errMessage);
}
