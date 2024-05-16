import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/product.dart';
import '../../../data/repos/home_repo.dart';

part 'agricultural_fertilizers_state.dart';

class AgriculturalFertilizersCubit extends Cubit<AgriculturalFertilizersState> {
  AgriculturalFertilizersCubit(this.homeRepo) : super(AgriculturalFertilizersInitial());

  final HomeRepo homeRepo;
  Future<void> fetchAgriculturalFertilizersProducts() async {
    emit(AgriculturalFertilizersLoading());
    var result = await homeRepo.fetchAgriculturalFertilizersProducts();
    result.fold((failure) => emit(AgriculturalFertilizersFailure(failure.errMessage)),
            (products) => emit(AgriculturalFertilizersSuccess(products)));
  }
}
