import 'package:akhder/features/home/data/models/product.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/home_repo.dart';

part 'insecticides_products_state.dart';

class InsecticidesProductsCubit extends Cubit<InsecticidesProductsState> {
  InsecticidesProductsCubit(this.homeRepo) : super(InsecticidesProductsInitial());
  final HomeRepo homeRepo;
  Future<void> fetchInsecticidesProducts() async {
    emit(InsecticidesProductsLoading());
    var result = await homeRepo.fetchInsecticidesProducts();
    result.fold((failure) => emit(InsecticidesProductsFailure(failure.errMessage)),
        (products) => emit(InsecticidesProductsSuccess(products)));
  }
}
