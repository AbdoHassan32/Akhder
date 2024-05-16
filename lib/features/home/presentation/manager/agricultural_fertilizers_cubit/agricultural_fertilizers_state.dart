part of 'agricultural_fertilizers_cubit.dart';

@immutable
abstract class AgriculturalFertilizersState {}

class AgriculturalFertilizersInitial extends AgriculturalFertilizersState {}

class AgriculturalFertilizersLoading extends AgriculturalFertilizersState {}

class AgriculturalFertilizersSuccess extends AgriculturalFertilizersState {
  final List<Product> products;
  AgriculturalFertilizersSuccess(this.products);
}

class AgriculturalFertilizersFailure extends AgriculturalFertilizersState {
  final String errMessage;
  AgriculturalFertilizersFailure(this.errMessage);
}